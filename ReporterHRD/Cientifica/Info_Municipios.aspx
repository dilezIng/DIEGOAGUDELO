<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="Info_Municipios.aspx.vb"  Inherits="PaginaBase"%>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        font-size: small;
    }
    .auto-style2 {
        font-size: medium;
        text-align: left;
    }
        .auto-style3 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
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
          
             <asp:Panel ID="Panel1" runat="server">
  <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; ">
            <td colspan="4" bgcolor="#77CEE3" 
                ><span class="auto-style3">Relación de pacientes del municipio de Socotá afiliados a las EAPB: (COMFAMILIAR HUILA (CCF024), COMPARTA (ESS133), COOSALUD EPS y NUEVA EPS), atendidos por servicios de ayuda diagnóstica (laboratorios, rayos x, ecografías, etc) donde se evidencie la fecha de solicitud de la cita y la fecha de atención efectiva.</span> </td>

        </tr>

        <tr >
            
            <td colspan="2" 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style12" >
                &nbsp;
                Fecha Inicial:<asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender> &nbsp;
                Fecha Final:<asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>
                <asp:Label ID="LabelFechaFin" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style1" >
                
                &lt;-- Fechas Corte</td>
                <td style="font-size: 9pt; text-align: center;" class="auto-style13" >
        &nbsp;
        <asp:Button ID="BtnActualizar" runat="server" Text="Consultar" /></td>
            
        </tr>
        <tr >
            <td colspan="2" class="auto-style2" >
                Municipio:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataMunicipios" DataTextField="MUNNOMMUN" DataValueField="MUNNOMMUN">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataMunicipios" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT [MUNNOMMUN] FROM [GENMUNICI] ORDER BY [MUNNOMMUN]"></asp:SqlDataSource>
                &nbsp;</td>
            <td style="text-align: left; font-size: 10pt;" colspan="2" >
                <asp:Label ID="LabelInfo" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Width="100%" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION" DataMember="DefaultView" AutoGenerateColumns="False" AllowSorting="True">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                       
                        <asp:BoundField DataField="MUNICIPIO" HeaderText="MUNICIPIO" SortExpression="MUNICIPIO" />
                        <asp:BoundField DataField="DocPaciente" HeaderText="DocPaciente" SortExpression="DocPaciente" />
                        <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" ReadOnly="True" />
                        <asp:BoundField DataField="CodExamen" HeaderText="CodExamen" SortExpression="CodExamen" />
                         <asp:BoundField DataField="NomExamen" HeaderText="NomExamen" SortExpression="NomExamen" ReadOnly="True" />
                        <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" SortExpression="Prioridad" ReadOnly="True" />
                        <asp:BoundField DataField="FechaSolicitud" HeaderText="FechaSolicitud" SortExpression="FechaSolicitud" />
                        <asp:BoundField DataField="FechaRespuesta" HeaderText="FechaRespuesta" SortExpression="FechaRespuesta" />
                        <asp:BoundField DataField="Cod_Entidad" HeaderText="Cod_Entidad" SortExpression="Cod_Entidad" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
                                      <asp:BoundField DataField="TipoIngreso" HeaderText="TipoIngreso" SortExpression="TipoIngreso" ReadOnly="True" />
                    
                       
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT GENMUNICI.MUNNOMMUN AS MUNICIPIO, GENPACIEN.PACNUMDOC AS DocPaciente, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS NOMBRE, GENSERIPS.SIPCODIGO AS CodExamen, RTRIM(GENSERIPS.SIPNOMBRE) AS NomExamen, CASE WHEN HCSESTADO = 0 THEN 'URGENTE' ELSE CASE WHEN HCSESTADO = 1 THEN 'RUTINARIO' ELSE CASE WHEN HCSESTADO = 2 THEN 'ELECTIVA' ELSE 'PRIORITARIA' END END END AS Prioridad, HCNSOLEXA.HCSFECSOL AS FechaSolicitud, HCNRESEXA.HCRFECRES AS FechaRespuesta, GEENENTADM.ENTCODIGO AS Cod_Entidad, GEENENTADM.ENTNOMBRE AS Entidad, CASE WHEN AINTIPING = 1 THEN 'Ambulatorio' ELSE 'Hospitalario' END AS TipoIngreso FROM GENPACIEN INNER JOIN ADNINGRESO ON GENPACIEN.OID = ADNINGRESO.GENPACIEN INNER JOIN HCNSOLEXA ON ADNINGRESO.OID = HCNSOLEXA.ADNINGRESO INNER JOIN GENSERIPS ON HCNSOLEXA.GENSERIPS = GENSERIPS.OID INNER JOIN HCNRESEXA ON HCNSOLEXA.HCNRESEXA = HCNRESEXA.OID INNER JOIN HCNFOLIO ON HCNSOLEXA.HCNFOLIO = HCNFOLIO.OID INNER JOIN GENMEDICO ON HCNRESEXA.GENMEDICO = GENMEDICO.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID INNER JOIN GENMUNICI ON GENPACIEN.DGNMUNICIPIO = GENMUNICI.OID WHERE (HCNSOLEXA.HCSFECSOL BETWEEN @ini AND @fin) AND (GENMUNICI.MUNNOMMUN = @muni) AND (GEENENTADM.ENTCODIGO = 'CCF024' OR GEENENTADM.ENTCODIGO = 'ESS133' OR GEENENTADM.ENTCODIGO = 'CCF024' OR GEENENTADM.ENTCODIGO = 'EPSS43' OR GEENENTADM.ENTCODIGO = 'EPSS41') AND (ADNINGRESO.AINTIPING = 1) ORDER BY Entidad, GENSERIPS.SIPNOMBRE, FechaSolicitud">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextFechaIni" Name="ini" PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelFechaFin" Name="fin" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="muni" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <strong>Ing. Diego A. Agudelo J</strong></td>
        </tr>
                    <tr>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td class="auto-style14">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                        <td class="auto-style15">
                            &nbsp;</td>
                    </tr>
    </table>

            </asp:Panel>



           </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
