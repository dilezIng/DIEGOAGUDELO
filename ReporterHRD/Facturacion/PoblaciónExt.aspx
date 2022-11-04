<%@ Page Title="Informes" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="PoblaciónExt.aspx.vb" Inherits="PoblaciónExt" %>

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
                <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="4" 
                >INFORMACION POBLACION VENEZOLANA - EXTRANJERA</td>
        </tr>

        <tr >
            <td style="width: 25%; font-size: 9pt;" >
                Sede:
                <asp:RadioButtonList ID="ListSedes" runat="server" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" 
                    Enabled="False">
                    <asp:ListItem Value="0" Selected="True">Duitama</asp:ListItem>
                   
                </asp:RadioButtonList>
            </td>
            <td style="width: 25%" >
                Fecha Inicial:<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> </td>
            <td style="width: 25%" >
                Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
                <asp:Label ID="LabelFechaFin" runat="server" Visible="false"></asp:Label> </td>
            <td style="width: 25%; text-align: right;" >
                <asp:Button ID="BtnExportar" runat="server" Enabled="true" 
                    Text="Exportar a Excel" Visible="false" />
<asp:Button ID="BtnActualizar" runat="server" Text="Actualizar"  />
            </td>
        </tr>
        <tr >
            <td style="font-size: 9pt;" colspan="2" >
                &nbsp;</td>
            <td style="text-align: right; font-size: 10pt;" colspan="2" >
                <asp:Label ID="LabelInfo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="IPS" HeaderText="IPS" ReadOnly="True" SortExpression="IPS" />
                        <asp:BoundField DataField="PUBLICA" HeaderText="PUBLICA" ReadOnly="True" SortExpression="PUBLICA" />
                        <asp:BoundField DataField="PRIVADA" HeaderText="PRIVADA" ReadOnly="True" SortExpression="PRIVADA" />
                        <asp:BoundField DataField="NOMBRES_APELLIDOS_PACIENTE" HeaderText="NOMBRES_APELLIDOS_PACIENTE" ReadOnly="True" SortExpression="NOMBRES_APELLIDOS_PACIENTE" />
                        <asp:BoundField DataField="EDAD" HeaderText="EDAD" ReadOnly="True" SortExpression="EDAD" />
                        <asp:BoundField DataField="GENERO" HeaderText="GENERO" ReadOnly="True" SortExpression="GENERO" />
                        <asp:BoundField DataField="MOTIVOCONSULTA" HeaderText="MOTIVOCONSULTA" ReadOnly="True" SortExpression="MOTIVOCONSULTA" />
                        <asp:BoundField DataField="PROCEDIMIENTO" HeaderText="PROCEDIMIENTO" ReadOnly="True" SortExpression="PROCEDIMIENTO" />
                        <asp:BoundField DataField="FACTURADODELSERVICIO" HeaderText="FACTURADODELSERVICIO" SortExpression="FACTURADODELSERVICIO" />
                        <asp:BoundField DataField="NUMERODEFACTURA" HeaderText="NUMERODEFACTURA" SortExpression="NUMERODEFACTURA" />
                        <asp:BoundField DataField="FECHAATENCION" HeaderText="FECHAATENCION" SortExpression="FECHAATENCION" />
                        <asp:BoundField DataField="INGRESO" HeaderText="INGRESO" SortExpression="INGRESO" />
                    </Columns>
                </asp:GridView>

                
            </td>
        </tr>
                    <tr>
                        <td style="width: 25%">
                            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
<asp:Label ID="Label1111" runat="server" Visible="True" Font-Size="XX-Small" Font-Bold="true">Ing Diego A</asp:Label>
                        </td>
                        <td style="width: 25%">
                            <asp:SqlDataSource ID="SqlDataSource1" 
                                runat="server" 
                                       ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 

                                SelectCommand="SELECT DISTINCT 'HOSPITAL REGIONAL DUITAMA PRIMER NIVEL' AS IPS, 'SI' AS PUBLICA, 'NO' AS PRIVADA, LTRIM(RTRIM(GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM + N' ' + GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE)) AS NOMBRES_APELLIDOS_PACIENTE, STR(DATEDIFF(month, GENPACIEN.GPAFECNAC, GETDATE()) / 12.0, 4, 1) AS EDAD, CASE WHEN GPASEXPAC = 2 THEN 'F' ELSE 'M' END AS GENERO, (SELECT TOP (1) G.DIANOMBRE FROM HCNFOLIO AS H INNER JOIN HCNDIAPAC AS HC ON H.OID = HC.HCNFOLIO INNER JOIN GENDIAGNO AS G ON HC.GENDIAGNO = G.OID WHERE (H.ADNINGRESO = ADNINGRESO.OID) ORDER BY H.OID DESC) AS MOTIVOCONSULTA, CASE WHEN GENDETCON.GDECODIGO = 'VIN05098' THEN 'ATENCION DE URGENCIAS' WHEN GENDETCON.GDECODIGO = 'VIN05099' THEN 'ATENCION HOSPITALARIA' END AS PROCEDIMIENTO, SLNFACTUR.SFATOTFAC AS FACTURADODELSERVICIO, SLNFACTUR.SFANUMFAC AS NUMERODEFACTURA, ADNINGRESO.AINFECING AS FECHAATENCION, ADNINGRESO.AINCONSEC AS INGRESO FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENCONTRA.OID = GENDETCON.GENCONTRA1 INNER JOIN ADNEGRESO ON ADNEGRESO.ADNINGRESO = ADNINGRESO.OID WHERE (GENDETCON.GDECODIGO LIKE '%VIN0509%') AND (SLNFACTUR.SFADOCANU = 0) AND (ADNINGRESO.AINFECING BETWEEN @P1 AND @P2) ORDER BY FECHAATENCION">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextFechaIni" Name="P1" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="LabelFechaFin" Name="P2" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
    </table>

            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

