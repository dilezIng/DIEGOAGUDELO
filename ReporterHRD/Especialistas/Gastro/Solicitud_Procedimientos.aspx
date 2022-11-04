<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Solicitud_Procedimientos.aspx.vb" Inherits="Urgencias_Estancia" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

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
    }
           
    .auto-style2 {
        width: 32%;
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
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../../Images/Fondo01.jpg');">
            <td colspan="4" class="auto-style1" >SOLICITUDES CODIGOS 18300 18401 &nbsp; <asp:Label ID="LabelFolio" runat="server" ></asp:Label></td>

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
                
                &nbsp;</td>
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
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridEstancia" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="100%" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="INGRESO" HeaderText="INGRESO" SortExpression="INGRESO" />
                        <asp:BoundField DataField="IDENTIFICACION" HeaderText="IDENTIFICACION" SortExpression="IDENTIFICACION" />
                        <asp:BoundField DataField="PACIENTE" HeaderText="PACIENTE" SortExpression="PACIENTE" ReadOnly="True" />
                        <asp:BoundField DataField="FECHA_SOLICITUD" HeaderText="FECHA_SOLICITUD" SortExpression="FECHA_SOLICITUD" />
                        <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" SortExpression="CODIGO" />
                        <asp:BoundField DataField="PROCEDIMIENTO" HeaderText="PROCEDIMIENTO" SortExpression="PROCEDIMIENTO" />
                        <asp:BoundField DataField="OBSERVACION" HeaderText="OBSERVACION" SortExpression="OBSERVACION" />
                        <asp:BoundField DataField="ESTANCIA" HeaderText="ESTANCIA" SortExpression="ESTANCIA" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridEstancia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT DISTINCT ADNINGRESO.AINCONSEC AS INGRESO, GENPACIEN.PACNUMDOC AS IDENTIFICACION, LTRIM(RTRIM(GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS PACIENTE, HCNSOLPQX.HCSFECSOL AS FECHA_SOLICITUD, GENSERIPS.SIPCODIGO AS CODIGO, GENSERIPS.SIPNOMBRE AS PROCEDIMIENTO, HCNSOLPQX.HCSOBSERV AS OBSERVACION, HPNDEFCAM.HCACODIGO AS ESTANCIA FROM HCNSOLPQX INNER JOIN ADNINGRESO ON HCNSOLPQX.ADNINGRESO = ADNINGRESO.OID INNER JOIN HPNESTANC ON ADNINGRESO.OID = HPNESTANC.ADNINGRES INNER JOIN HPNDEFCAM ON HPNESTANC.HPNDEFCAM = HPNDEFCAM.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENARESER ON HCNSOLPQX.GENARESER = GENARESER.OID INNER JOIN GENSERIPS ON HCNSOLPQX.GENSERIPS = GENSERIPS.OID LEFT OUTER JOIN HCNQXEPAC ON HCNSOLPQX.OID &lt;&gt; HCNQXEPAC.HCNSOLPQX WHERE (GENSERIPS.SIPCODIGO = '18300' OR GENSERIPS.SIPCODIGO = '18401') AND (HCNSOLPQX.HCSFECSOL BETWEEN @FechaInicial AND @FechaFinal + ' 23:59:59') ORDER BY CODIGO, FECHA_SOLICITUD DESC"
                    
                    
                    
                    ><SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        
                    </SelectParameters>
                </asp:SqlDataSource>
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


