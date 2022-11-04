<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Ruta_Respiratoria.aspx.vb" Inherits="Ruta_Respiratoria" %>

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
        color: #ABD3F2;
        text-align: center;
    }
           
    .auto-style2 {
            width: 21%;
        }
           
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            font-size: small;
        }
           
        .auto-style5 {
            width: 42%;
        }
           
        .auto-style10 {
            width: 39%;
            text-align: left;
        }
        .auto-style13 {
            width: 20%;
            text-align: left;
        }
        .auto-style14 {
            width: 25%;
        }
        .auto-style15 {
            width: 19%;
            text-align: left;
        }
        .auto-style16 {
            width: 25%;
            text-align: left;
        }
           
        .auto-style17 {
            text-align: left;
        }
        .auto-style18 {
            width: 21%;
            text-align: left;
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
            <td colspan="6" class="auto-style1" >Pacientes Ruta Respiratoria <asp:Label ID="LabelFolio" runat="server" ></asp:Label></td>

        </tr>

        <tr >
            
            <td  
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; " class="auto-style18" >
                
                Fecha Inicial:<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> 
              
            </td>
            <td style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; " class="auto-style16" >
 Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
  <asp:Button ID="BtnExportar" runat="server" Text="Exportar_URGE" />
    <asp:Button ID="BtnExportar2" runat="server" Text="Exportar_URPE" />
            </td>
            <td  style=" border: 1px solid #CCCCCC; background-color: #ffd800; style="width: 30%; text-align: right;" class="auto-style15"  >
                
                HCURGE:
                <asp:Label ID="LabelURGE" runat="server" ></asp:Label>
                </td>
            <td  style=" border: 1px solid #CCCCCC; background-color: #80ea07; style="width: 30%; text-align: right;" class="auto-style13" >
                
                HCURPE:
                  <asp:Label ID="LabelURPE" runat="server" ></asp:Label>
            </td>
            <td  style=" border: 1px solid #CCCCCC; background-color: #ff6a00; style="width: 30%; text-align: right;" class="auto-style10" >
                
                TOTAL
                  <asp:Label ID="LbTOTAL" runat="server" ></asp:Label>
            </td>
                <td style="width: 20%; font-size: 9pt; " class="auto-style17" >
       
        <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" style="height: 26px" /></td>
            
        </tr>
        <tr >
            <td colspan="6" 
                style="text-align: right; font-size: 8pt;" >
                &nbsp;</td>
        </tr>
        <tr >
            <td colspan="6" 
                style="font-size: 8pt;" class="auto-style3" >
                <strong>
                <asp:Label ID="Label2" runat="server" Text="PACIENTES ATENDIDOS CON FOLIO HCURPE" CssClass="auto-style4"></asp:Label>
                </strong></td>
        </tr>
        <tr >
            <td colspan="6" 
                style="text-align: right; font-size: 8pt;" >
                <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="Dataurpe" CssClass="auto-style4">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
					<asp:BoundField DataField="Sede" HeaderText="Sede" SortExpression="Sede" />
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                        <asp:BoundField DataField="FECHA INGRESO" HeaderText="FECHA INGRESO" SortExpression="FECHA INGRESO" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                        <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                        <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                        <asp:BoundField DataField="Medico" HeaderText="Medico" ReadOnly="True" SortExpression="Medico" />
                        <asp:BoundField DataField="NUM FOLIO" HeaderText="NUM FOLIO" SortExpression="NUM FOLIO" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr >
            <td colspan="6" 
                style="font-size: 8pt;" class="auto-style3" >
                <strong>
                <asp:Label ID="Label1" runat="server" Text="PACIENTES ATENDIDOS CON FOLIO HCURGE" CssClass="auto-style4"></asp:Label>
                </strong>
            </td>
        </tr>
        <tr >
            <td colspan="6" style="font-size: 8pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="Dataurge" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True"


                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION" CssClass="auto-style4">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
					<asp:BoundField DataField="Sede" HeaderText="Sede" SortExpression="Sede" />
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
						<asp:BoundField DataField="FECHA INGRESO" HeaderText="FECHA INGRESO" SortExpression="FECHA INGRESO" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                        <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                        <asp:BoundField DataField="Regimen" HeaderText="Regimen" SortExpression="Regimen" />
                        <asp:BoundField DataField="Medico" HeaderText="Medico" ReadOnly="True" SortExpression="Medico" />
                        <asp:BoundField DataField="NUM FOLIO" HeaderText="NUM FOLIO" SortExpression="NUM FOLIO" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="Dataurge" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT ADNINGRESO.AINCONSEC AS Ingreso, CASE WHEN ADNINGRESO.ADNCENATE=1 THEN 'Duitama' WHEN ADNINGRESO.ADNCENATE=2 THEN 'Sta Rosa' WHEN ADNINGRESO.ADNCENATE=3 THEN 'Sativasur' END AS Sede, ADNINGRESO.AINFECING AS 'FECHA INGRESO', GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + CASE WHEN GENPACIEN.PACSEGNOM IS NULL THEN '' ELSE GENPACIEN.PACSEGNOM END + ' ' + GENPACIEN.PACPRIAPE + ' ' + CASE WHEN GENPACIEN.PACSEGAPE IS NULL THEN '' ELSE GENPACIEN.PACSEGAPE END  AS Paciente, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad, GEENENTADM.ENTNOMBRE AS Entidad, GENDETCON.GDECODIGO AS Regimen, (SELECT GMENOMCOM FROM GENMEDICO WHERE (OID = (SELECT TOP (1) HCNFOLIO.GENMEDICO FROM HCNFOLIO INNER JOIN HCNDIAPAC ON HCNFOLIO.OID = HCNDIAPAC.HCNFOLIO WHERE (HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO.OID))) AS Medico, HCNFOLIO_1.HCNUMFOL AS 'NUM FOLIO' FROM HCNFOLIO AS HCNFOLIO_1 left JOIN HCMHCURGE ON  HCNFOLIO_1.OID =HCMHCURGE.HCNFOLIO left JOIN HCMWHCURG ON  HCNFOLIO_1.OID =HCMWHCURG.HCNFOLIO  INNER JOIN ADNINGRESO ON HCNFOLIO_1.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID WHERE (HCMHCURGE.HCCM10N111 = 'SI' or HCMWHCURG.HCCM10N111= 'SI') AND (ADNINGRESO.AINFECING BETWEEN @p0 AND @p1 + ' 23:59:59') ORDER BY HCMHCURGE.OID"
                    
                    
                    
                    ><SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0" 
                            PropertyName="Text" />
                        
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1" 
                            PropertyName="Text" />
                        
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="Dataurpe" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT ADNINGRESO.AINCONSEC AS Ingreso,CASE WHEN ADNINGRESO.ADNCENATE=1 THEN 'Duitama' WHEN ADNINGRESO.ADNCENATE=2 THEN 'Sta Rosa' WHEN ADNINGRESO.ADNCENATE=3 THEN 'Sativasur' END AS Sede, ADNINGRESO.AINFECING AS 'FECHA INGRESO', GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + CASE WHEN GENPACIEN.PACSEGNOM IS NULL THEN '' ELSE GENPACIEN.PACSEGNOM END + ' ' + GENPACIEN.PACPRIAPE + ' ' + CASE WHEN GENPACIEN.PACSEGAPE IS NULL THEN '' ELSE GENPACIEN.PACSEGAPE END AS Paciente, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad, GEENENTADM.ENTNOMBRE AS Entidad, GENDETCON.GDECODIGO AS Regimen, (SELECT GMENOMCOM FROM GENMEDICO WHERE (OID = (SELECT TOP (1) HCNFOLIO.GENMEDICO FROM HCNFOLIO INNER JOIN HCNDIAPAC ON HCNFOLIO.OID = HCNDIAPAC.HCNFOLIO WHERE (HCNFOLIO.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO.OID))) AS Medico, HCNFOLIO_1.HCNUMFOL AS 'NUM FOLIO' FROM HCMHCURPE INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON HCMHCURPE.HCNFOLIO = HCNFOLIO_1.OID INNER JOIN ADNINGRESO ON HCNFOLIO_1.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID WHERE (ADNINGRESO.AINFECING BETWEEN @p0 AND @p1 + ' 23:59:59') AND (HCMHCURPE.HCCM10N140 = 'SI') ORDER BY HCMHCURPE.OID"
                    
                    
                    
                    ><SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="p0" 
                            PropertyName="Text" />
                        
                        <asp:ControlParameter ControlID="TextFechaFin" Name="p1" 
                            PropertyName="Text" />
                        
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
                    <tr>
                        <td class="auto-style2">
                          
                        </td>
                        <td class="auto-style14">
                            &nbsp;</td>
                        <td class="auto-style5" colspan="3">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
    </table>

            

</asp:Content>


