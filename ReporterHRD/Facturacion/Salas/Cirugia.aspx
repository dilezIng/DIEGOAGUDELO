<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Cirugia.aspx.vb" Inherits="Facturacion_Ciruguia" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<%@ Register assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" namespace="eWorld.UI" tagprefix="ew" %>

 <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%@ Register assembly="eWorld.UI" namespace="eWorld.UI" tagprefix="ew" %>


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
        text-align: center;
    }
               
</style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"  EnableScriptGlobalization="True">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <asp:Label ID="LabelProgress" runat="server">
                                <div style="top: 0px; height: 100%; background-color: White; 
                     opacity: 0.75; filter: alpha(opacity=75);
                     vertical-align: middle; left: 0px; z-index: 999999; width: 1000px;
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
        <tr >
            <td colspan="4" style="font-weight: bold; font-size: 20pt; color: #FFFFFF;  " bgcolor="#A6D0F1">
                Cirugias</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                <asp:Label ID="Label1" runat="server" Text="Label">Seleccione un dia:</asp:Label>
                <asp:TextBox ID="TextFechaIni" runat="server" Rows="10" Width="80px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender>
            </td>
            <td style="width: 25%" >
                <asp:Button ID="BtnConsulta" runat="server" Text="Consultar" />
                <asp:Button ID="BtnRegresar" runat="server" Text="Regresar" />
            <asp:Label ID="LabelCant" runat="server" 
                    style="color: #006600; font-weight: 700"></asp:Label>
            </td>
            <td style="width: 25%" >
                
              
                <asp:Label ID="LabelInfo" runat="server" ></asp:Label>
            </td>
            <td style="width: 25%" >
         

                 &nbsp;</td>
        </tr>
        <tr >
            <td colspan="4" style="width: 100%; font-size: 10pt;" >
                <div class="auto-style1">
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataCirugia" Width="100%" PageSize="300" EmptyDataText="No existen registros para el filtro seleccionado." AllowSorting="True">
        <AlternatingRowStyle BackColor="#F0F0F0" />
            <Columns>
                <asp:BoundField DataField="FechaCirugia" HeaderText="FechaCirugia" SortExpression="FechaCirugia" />
                <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                <asp:BoundField DataField="Egreso" HeaderText="Egreso" SortExpression="Egreso" ReadOnly="True" />
                <asp:BoundField DataField="Fecha_Egreso" HeaderText="Fecha_Egreso" SortExpression="Fecha_Egreso" ReadOnly="True" />
                <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                <asp:BoundField DataField="Paciente" HeaderText="Paciente" ReadOnly="True" SortExpression="Paciente" />
                <asp:BoundField DataField="Edad" HeaderText="Edad" ReadOnly="True" SortExpression="Edad" />
                <asp:BoundField DataField="Municipio" HeaderText="Municipio" SortExpression="Municipio" ReadOnly="True" />
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" ReadOnly="True" />
                <asp:BoundField DataField="Procedimiento" HeaderText="Procedimiento" SortExpression="Procedimiento" ReadOnly="True" />
                <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" ReadOnly="True" />
                <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" />
                <asp:BoundField DataField="Medico" HeaderText="Medico" SortExpression="Medico" />
                <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
            </Columns>
        </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataCirugia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    
                    SelectCommand="SELECT DISTINCT HCNFOLIO.HCFECFOL AS FechaCirugia, ADNINGRESO.AINCONSEC AS Ingreso, CASE WHEN ADNINGRESO.ADNEGRESO IS NULL THEN ADNINGRESO.ADNEGRESO ELSE (SELECT ADNEGRESO.ADENUMEGR FROM ADNEGRESO WHERE ADNINGRESO.ADNEGRESO = ADNEGRESO.OID) END AS Egreso, (SELECT ADEFECSAL FROM ADNEGRESO WHERE (ADNINGRESO.ADNEGRESO = OID)) AS Fecha_Egreso, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS Paciente, CAST(DATEDIFF(dd, GENPACIEN.GPAFECNAC, GETDATE()) / 365.25 AS int) AS Edad, (SELECT MUNNOMMUN FROM GENMUNICI WHERE (OID = GENPACIEN.DGNMUNICIPIO)) AS Municipio, (SELECT PACTELEFONO FROM GENPACIENT WHERE (OID = GENPACIEN.GENPACIENT)) AS Telefono, (SELECT TOP (1) GENSERIPS.SIPCODIGO + N'-' + RTRIM(GENSERIPS.SIPNOMBRE) AS CodServPracticado FROM HCNQXEPAC INNER JOIN GENSERIPS ON HCNQXEPAC.GENSERIPS = GENSERIPS.OID WHERE (HCNQXEPAC.HCNFOLIO = HCNFOLIO.OID)) AS Procedimiento, GENDETCON.GDENOMBRE + N' (' + GENDETCON.GDECODIGO + N')' AS Entidad, GENESPECI.GEEDESCRI AS Especialidad, GENUSUARIO.USUDESCRI AS Medico, HCNQXEPAC_1.HCSOBSERV AS Observacion FROM GENPACIEN INNER JOIN HCNFOLIO ON GENPACIEN.OID = HCNFOLIO.GENPACIEN INNER JOIN HCMHCINQX ON HCNFOLIO.OID = HCMHCINQX.HCNFOLIO INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN HCNQXEPAC AS HCNQXEPAC_1 ON HCNFOLIO.OID = HCNQXEPAC_1.HCNFOLIO INNER JOIN GENSERIPS AS GENSERIPS_1 ON HCNQXEPAC_1.GENSERIPS = GENSERIPS_1.OID INNER JOIN GENESPECI ON HCNFOLIO.GENESPECI = GENESPECI.OID INNER JOIN GENMEDICO ON HCNFOLIO.GENMEDICO = GENMEDICO.OID INNER JOIN GENUSUARIO ON GENMEDICO.GENUSUARIO = GENUSUARIO.OID WHERE (CONVERT (char(10), HCNFOLIO.HCFECFOL, 103) = @TextFechaIni) ORDER BY Egreso DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="TextFechaIni" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>

        </tr>
        <tr>
            <td colspan="4">
               
            </td>
        </tr>
    </table>

        
     


</asp:Content>

