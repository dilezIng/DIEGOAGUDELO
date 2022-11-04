<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Estancia.aspx.vb" Inherits="Urgencias_Estancia" %>

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
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="4" class="auto-style1" >OCUPACION CAMAS OBSERVACION URGENCIAS&nbsp; <asp:Label ID="LabelFolio" runat="server" ></asp:Label></td>

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
                
                Grupo de Camas:<asp:DropDownList ID="GrupoCama" runat="server" DataSourceID="SqlDataGrupos" DataTextField="HGRCODIGO" DataValueField="OID" AutoPostBack="True">
                   
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataGrupos" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT N'( ' + HGRCODIGO + ' ) ' + HGRNOMBRE AS HGRCODIGO, OID FROM HPNGRUPOS">
                </asp:SqlDataSource>
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
                    AllowSorting="True" Width="100%" AllowPaging="True" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="Cod_Grupo" HeaderText="Cod_Grupo" SortExpression="Cod_Grupo" />
                        <asp:BoundField DataField="Cama" HeaderText="Cama" SortExpression="Cama" />
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                        <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                        <asp:BoundField DataField="NomPaciente" HeaderText="NomPaciente" ReadOnly="True" SortExpression="NomPaciente" />
                        <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                        <asp:BoundField DataField="Nom_Grupo" HeaderText="Nom_Grupo" SortExpression="Nom_Grupo" />
                        <asp:BoundField DataField="Fecha_Ingreso" HeaderText="Fecha_Ingreso" SortExpression="Fecha_Ingreso" />
                        <asp:BoundField DataField="Fecha_Salida" HeaderText="Fecha_Salida" SortExpression="Fecha_Salida" />
                        <asp:BoundField DataField="Dx" HeaderText="Dx" ReadOnly="True" SortExpression="Dx" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridEstancia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
                  
                    SelectCommand="SELECT DISTINCT HPNGRUPOS.HGRCODIGO AS Cod_Grupo, HPNDEFCAM.HCACODIGO AS Cama, ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS Documento, LTRIM(RTRIM(GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM)) AS NomPaciente, ABS(DATEDIFF(yy, GENPACIEN.GPAFECNAC, GETDATE())) AS Edad, HPNGRUPOS.HGRNOMBRE AS Nom_Grupo, HPNESTANC.HESFECING AS Fecha_Ingreso, HPNESTANC.HESFECSAL AS Fecha_Salida, (SELECT DIACODIGO FROM GENDIAGNO WHERE (OID = (SELECT TOP (1) GENDIAGNO FROM HCNDIAPAC WHERE (HCNFOLIO = (SELECT TOP (1) OID FROM HCNFOLIO AS HCNFOLIO_2 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC))))) AS Dx FROM HPNESTANC INNER JOIN HPNDEFCAM ON HPNESTANC.HPNDEFCAM = HPNDEFCAM.OID INNER JOIN ADNINGRESO ON HPNESTANC.ADNINGRES = ADNINGRESO.OID INNER JOIN HCNFOLIO AS HCNFOLIO_1 ON ADNINGRESO.OID = HCNFOLIO_1.ADNINGRESO INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN HPNGRUPOS ON HPNDEFCAM.HPNGRUPOS = HPNGRUPOS.OID WHERE (HPNESTANC.HESFECING BETWEEN @FechaInicial AND @FechaFinal + ' 23:59:59') AND (HPNDEFCAM.HPNGRUPOS = @GrupoCama) ORDER BY Cama"
                    
                    
                    
                    ><SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="FechaInicial" 
                            PropertyName="Text" DefaultValue="" />
                        <asp:ControlParameter ControlID="TextFechaFin" Name="FechaFinal" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="GrupoCama" Name="GrupoCama" PropertyName="SelectedValue" />
                        
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


