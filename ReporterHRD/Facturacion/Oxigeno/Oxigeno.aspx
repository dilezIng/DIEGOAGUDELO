<%@ Page Title="Administración de Oxigeno" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="Oxigeno.aspx.vb" Inherits="Oxigeno" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/EnEspera.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            background-color: #75B2E2;
            text-align: left;
            height: 39px;
        }
        .auto-style3 {
            color: #FFFFFF;
            background-color: #75B2E2;
            height: 39px;
        }
        .auto-style6 {
            color: #FFFFFF;
            height: 29px;
            font-size: large;
            background-color: #75B2E2;
            text-align: center;
        }
        .auto-style10 {
            height: 30px;
            font-size: medium;
            background-color: #FFFF66;
            text-align: center;
        }
        .auto-style11 {
            height: 30px;
            font-size: medium;
            background-color: #00CC00;
            text-align: center;
        }
        .auto-style12 {
            font-size: medium;
        }
        .auto-style14 {
            background-color: #FFFFFF;
        }
        .auto-style26 {
            height: 23px;
            font-size: medium;
            background-color: #FFFF66;
            width: 218px;
            text-align: center;
        }
        .auto-style27 {
            background-color: #FFFF66;
            width: 218px;
            text-align: center;
        }
        .auto-style33 {
            font-size: x-small;
        }
        .auto-style34 {
            background-color: #00CC00;
            width: 230px;
            height: 23px;
            text-align: center;
        }
        .auto-style36 {
            background-color: #FFFF66;
            width: 218px;
            height: 23px;
            text-align: center;
        }
        .auto-style38 {
            height: 23px;
            width: 1208px;
            text-align: center;
        }
        .auto-style39 {
            font-size: medium;
            width: 1208px;
            text-align: center;
        }
        .auto-style40 {
            width: 1208px;
            text-align: center;
        }
        .auto-style41 {
            font-size: medium;
            color: #FF0000;
        }
        .auto-style43 {
            font-size: medium;
            width: 1257px;
            text-align: center;
        }
        .auto-style46 {
            font-size: medium;
            color: #000000;
        }
        .auto-style47 {
            font-size: xx-small;
        }
        .auto-style48 {
            height: 23px;
            font-size: medium;
            background-color: #00CC00;
            width: 601px;
            text-align: center;
        }
        .auto-style49 {
            background-color: #00CC00;
            width: 601px;
            text-align: center;
        }
        .auto-style50 {
            background-color: #00CC00;
            width: 601px;
            height: 23px;
            text-align: center;
        }
        .auto-style51 {
            font-size: medium;
            color: #FFFFFF;
        }
        .auto-style52 {
            color: #3399FF;
        }
        .auto-style53 {
            color: #0099FF;
        }
        .auto-style54 {
            color: #FFFFFF;
        }
        .auto-style55 {
            width: 1257px;
            text-align: center;
        }
        .auto-style56 {
            height: 23px;
            width: 1257px;
            text-align: center;
        }
        .auto-style57 {
            height: 23px;
            font-size: medium;
            background-color: #FFFF66;
            width: 847px;
            text-align: center;
        }
        .auto-style58 {
            background-color: #FFFF66;
            width: 847px;
            text-align: center;
        }
        .auto-style59 {
            background-color: #FFFF66;
            width: 847px;
            height: 23px;
            text-align: center;
        }
        .auto-style60 {
            font-size: medium;
            color: #0000FF;
        }
        .auto-style61 {
            background-color: #00CC00;
            height: 23px;
        }
        .auto-style64 {
            color: #0000FF;
            background-color: #FEFFFF;
        }
        .auto-style65 {
            font-size: medium;
            color: #0000FF;
            background-color: #FEFFFF;
        }
        .auto-style66 {
            height: 21px;
            width: 601px;
        }
        .auto-style68 {
            height: 21px;
            width: 230px;
            text-align: center;
        }
        .auto-style72 {
            height: 21px;
            text-align: left;
        }
        .auto-style73 {
            height: 23px;
            font-size: medium;
            background-color: #00CC00;
            width: 230px;
            text-align: center;
        }
        .nuevoEstilo1 {
            font-family: Tahoma;
            font-size: x-large;
            width: auto;
            overflow: scroll;
        }
        .auto-style74 {
            text-align: center;
        }
        .auto-style75 {
            width: 125px;
        }
        .auto-style76 {
            width: 25%;
        }
        .auto-style77 {
            width: 92px;
        }
        .auto-style78 {
            width: 20%;
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
     <script language="javascript">

      function ShowModalPopup() {

          $find("Panel1_ModalPopupExtender").show();

      }

      function HideModalPopup() {

          $find("Panel1_ModalPopupExtender").hide();

      }

     </script>
        </head>

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
                     <uc1:Cargando ID="Cargando" runat="server" /></div>
                            </asp:Label>
        </ProgressTemplate>
    </asp:UpdateProgress>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
               </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lBuSER" runat="server" > </asp:Label>

    <asp:Panel ID="Panel1" runat="server">
                <table style="font-family: tahoma;" class="auto-style1" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="4" class="auto-style1" ><span class="auto-style53">EDITAR OXIG</span><span class="auto-style52">ENO REGISTRADO&nbsp;&nbsp; <asp:Label ID="LabelPacientes" runat="server" CssClass="auto-style54"></asp:Label>
                </span>


            </td>

        </tr>

        <tr >
            
            <td  
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; " class="auto-style2" colspan="2" >
                
                <strong>
                <asp:Label ID="Lb_fechas" Font-Names="tahoma" runat="server" CssClass="auto-style41"></asp:Label>
                </strong></td>
            <td style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style3" colspan="2" >
              
                <asp:SqlDataSource ID="SqlDataGrupos" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT  HGRCODIGO , OID FROM HPNGRUPOS where oid&lt;=6"></asp:SqlDataSource>
            </td>
                <td style="font-size: 9pt; text-align: center;" class="auto-style78" >
       
                    </td>
            
        </tr>
        <tr >
            <td colspan="4" 
                style="text-align: right; font-size: 8pt;" >
                <br />
               
                <br />
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <div class="auto-style74">
                    <br />
                    <asp:TextBox ID="Tb_Ingreso" runat="server"></asp:TextBox>
                    &nbsp;<asp:Button ID="Button3" runat="server" Text="Buscar por Ingreso" />
                    <br />
                    <br />
                    <span class="auto-style12"><strong>PACIENTES CON ORDENES PENDIENTES DE CERRAR<br /> </strong></span>
                    <br />
                </div>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Ingreso" DataSourceID="DataGridEstancia0" EmptyDataText="NO HAY INFORMACION PARA LA SELECCION" Font-Names="Tahoma" PageSize="300" Width="98%">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" SortExpression="Ingreso" />
                        <asp:BoundField DataField="Sitio" HeaderText="Sitio" SortExpression="Sitio" />
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente" />
                        <asp:BoundField DataField="Nombre_Paciente" HeaderText="Nombre_Paciente" SortExpression="Nombre_Paciente" />
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridEstancia" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT ADNINGRESO.AINCONSEC AS 'Ingreso', HCNFOLIO.HCNFECCONF AS 'Fecha folio', HCNFOLIO.HCNUMFOL AS 'N° Fol', CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urgencias' ELSE (SELECT TOP 1 HPNDEFCAM.HCACODIGO FROM HPNDEFCAM WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM ORDER BY HPNDEFCAM.OID DESC) END AS Sitio, GENPACIEN.PACNUMDOC AS 'Documento', GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS 'Paciente', CAST(DATEDIFF(dd, GENPACIEN.GPAFECNAC, GETDATE()) / 365.25 AS int) AS 'Edad', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291 OR HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN HCNSOLPNQX.OID ELSE HCNMEDPAC.OID END AS 'Solicitud', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN GENSERIPS.SIPCODIGO ELSE GENSERIPS2.SIPCODIGO END AS 'Codigo', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN GENSERIPS.SIPNOMBRE ELSE GENSERIPS2.SIPNOMBRE END AS 'Nombre', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN HCNSOLPNQX.HCSOBSERV ELSE HCNMEDPAC.HCSOBSERV END AS 'Observaciòn', GENDETCON.GDECODIGO AS 'Regimen', GENDETCON.GDENOMBRE AS 'Entidad' FROM HCNFOLIO LEFT OUTER JOIN HCNSOLPNQX ON HCNFOLIO.OID = HCNSOLPNQX.HCNFOLIO LEFT OUTER JOIN HCNMEDPAC ON HCNFOLIO.OID = HCNMEDPAC.HCNFOLIO LEFT OUTER JOIN GENSERIPS ON HCNSOLPNQX.GENSERIPS = GENSERIPS.OID LEFT OUTER JOIN GENSERIPS AS GENSERIPS2 ON HCNMEDPAC.GENSERIPS = GENSERIPS2.OID INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID AND ADNINGRESO.AINESTADO = 0 INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID WHERE (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) OR (HCNMEDPAC.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNMEDPAC.GENSERIPS BETWEEN 5507 AND 5508) ORDER BY sitio, 'Documento', 'N° Fol'">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="DataGridEstancia0" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT DISTINCT Ingreso, Sitio, Paciente, Nombre_Paciente FROM O2_Sum_Paciente WHERE (Hora_Fin='0') ORDER BY Ingreso desc"></asp:SqlDataSource>
                
                <br />
                </td>
        </tr>
                    <tr>
                        <td>
                          </td>
                        <td >
                            &nbsp;</td>
                        <td >
                            &nbsp;</td>
                        <td >
                            &nbsp;</td>
                    </tr>
    </table>

            </asp:Panel>
    
    
              
    <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center">

        <strong>
        Ingreso Actual: 
<asp:Label ID="LbIngreso" runat="server" CssClass="auto-style12"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="LbDocumento" runat="server" CssClass="auto-style46"></asp:Label>
        &nbsp;
        <asp:Label ID="LbPaciente" runat="server" CssClass="auto-style46"></asp:Label>
        <asp:Label ID="LbFecha" runat="server" CssClass="auto-style51"></asp:Label>
        &nbsp;
        <br />
      
        </strong>
        <asp:SqlDataSource ID="SQLOXIGENO" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT [Nombre], [Limite], [Id] FROM [O2_Forma_Sum] ORDER BY [Nombre]">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="Dat" Font-Names="Tahoma">
            <Columns>
              
                <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" />
                <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                <asp:BoundField DataField="Fecha_Folio" HeaderText="Fecha_Folio" SortExpression="Fecha_Folio" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                <asp:BoundField DataField="Suministro" HeaderText="Suministro Pendiente" SortExpression="Suministro" />
                <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Dat" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Solicitud, Folio, Fecha_Folio, Codigo, Suministro, Observacion FROM O2_Sum_Paciente WHERE (Ingreso = @Ingreso) and ((Hora_Fin = '0'))  order by Folio">
            <SelectParameters>
                <asp:ControlParameter ControlID="LbIngreso" Name="Ingreso" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
      
        
              
        </asp:Panel>
        <br />
      
        
        
             
              
        <asp:Panel ID="Paneltabla" runat="server">
        <table width="100%" border="1" cellpadding="0" cellspacing="0" frame="border" style="border: thin solid #C0C0C0; line-height: inherit; font-family: Tahoma;">
            <tr>
                <td colspan="6" class="auto-style6" style="border-style: inherit; border-width: thin; border-color: #000000; font-family: Tahoma;"   ><strong>ADMINISTRACION DE OXIGENO&nbsp;&nbsp;
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style68" style="border-style: inherit; border-width: thin; border-color: #000000; font-family: Tahoma;"><strong>
                    <span class="auto-style64">Folio: </span>
                    <asp:Label ID="LBFolio" runat="server" CssClass="auto-style65"></asp:Label>
                    </strong></td>
                <td class="auto-style66" style="border-style: inherit; border-width: thin; border-color: #000000; font-family: Tahoma;"><strong>
                    Solicitiud:
                    <asp:Label ID="LbSoliclitud" runat="server" CssClass="auto-style46"></asp:Label>
                    </strong></td>
                <td class="auto-style72" style="border-style: inherit; border-width: thin; border-color: #000000; font-family: Tahoma;" colspan="4"><strong>
                    &nbsp;<asp:Label ID="Label5" runat="server" CssClass="auto-style41"></asp:Label>
                    &nbsp;
                    </strong>
                    <table align="right" bgcolor="#75B2E2" border="1" class="auto-style76">
                        <tr>
                            <td bgcolor="White" class="auto-style74" colspan="6" style="border-style: none; border-width: inherit"><strong>OXIGENO PEDIATRIA<br /> &nbsp;(Litros)<br /> </strong></td>
                        </tr>
                        <strong>
                        <tr>
                            <td class="auto-style77">1/2</td>
                            <td bgcolor="White" class="auto-style75" style="border-style: none; border-width: inherit">0,5</td>
                            <td class="auto-style75" style="border-style: double; border-width: thin">1/8</td>
                            <td bgcolor="White" class="auto-style75">0,125</td>
                            <td class="auto-style75">1/32</td>
                            <td bgcolor="White" class="auto-style75">0,032</td>
                        </tr>
                        <tr>
                            <td class="auto-style77">1/4</td>
                            <td bgcolor="White" class="auto-style75" style="border-style: none; border-width: inherit">0,25</td>
                            <td class="auto-style75" style="border-style: double; border-width: thin">1/16</td>
                            <td bgcolor="White" class="auto-style75">0,063</td>
                            <td class="auto-style75">1/64</td>
                            <td bgcolor="White" class="auto-style75">0,016</td>
                        </tr>
                        </strong>
                    </table>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style11" colspan="2" style="border-width: thin; border-style: inherit; border-color: #000000; font-family: Tahoma;"><strong>Inicio: </strong>
                    
                </td>
                <td class="auto-style10" colspan="2" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;"><strong>Final</strong></td>
                <td class="auto-style39" rowspan="2" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;"><strong>
                    <asp:Label ID="Label2" runat="server" Text="Tipo Suministro"></asp:Label></strong></td>
                <td class="auto-style43" rowspan="2" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;"><strong>
                    <asp:Label ID="Label1" runat="server" Text="Cantidad Litros"></asp:Label></strong></td>
            </tr>
            <tr>
                <td class="auto-style73" style="border-width: thin; border-style: inherit; border-color: #000000; font-family: Tahoma;"><strong>
                    <asp:Label ID="Label3" runat="server" Text="Fecha"></asp:Label></strong></td>
                <td class="auto-style48" style="border-width: thin; border-style: inherit; border-color: #000000; font-family: Tahoma;"><strong>
                    <asp:Label ID="Label11" runat="server" Text="Horas&nbsp;&nbsp; Minutos"></asp:Label></strong></td>
                <td class="auto-style26" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;"><strong>
                    <asp:Label ID="Label9" runat="server" Text="Fecha"></asp:Label></strong></td>
                <td class="auto-style57" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;"><strong>
                    <asp:Label ID="Label10" runat="server" Text="Horas"></asp:Label>&nbsp;&nbsp; Minutos</strong></td>
            </tr>
            <tr>
                <td class="auto-style73" style="border-width: thin; border-style: inherit; border-color: #000000; font-family: Tahoma;">
                    <asp:TextBox ID="TextFechaIni" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaIni_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaIni" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaIni_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaIni">
                </asp:CalendarExtender>
                    

                </td>
                <td class="auto-style49" style="border-width: thin; border-style: inherit; border-color: #000000; font-family: Tahoma;">
                    <asp:TextBox ID="hi" runat="server" Width="30px" ></asp:TextBox>
                   :
                    <asp:TextBox ID="mi" Width="30px" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style27" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;">
                    <asp:TextBox ID="TextFechaFin" runat="server" Width="100px"></asp:TextBox>
                <asp:MaskedEditExtender ID="TextFechaFin_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextFechaFin" UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextFechaFin_CalendarExtender" runat="server" 
                    TargetControlID="TextFechaFin">
                </asp:CalendarExtender>

                </td>
                <td class="auto-style58" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;">
                    <asp:TextBox ID="hf" runat="server" Width="30px"></asp:TextBox>
                    :<asp:TextBox ID="mf" runat="server" Width="30px"></asp:TextBox>
&nbsp;</td>
                <td class="auto-style40" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;">
                    <asp:DropDownList ID="Listsum" runat="server" DataSourceID="SQLOXIGENO" DataTextField="Nombre" DataValueField="Id">
                    </asp:DropDownList>
                </td>
                <td class="auto-style55" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;">
                    <asp:TextBox ID="Ltssumin" runat="server" Width="39px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style34" style="border-width: thin; border-style: inherit; border-color: #000000; font-family: Tahoma;"><asp:RequiredFieldValidator ID="RequiredFieldValidatorfechin" runat="server" ControlToValidate="TextFechaIni" ErrorMessage="*requerido" ForeColor="Red" ValidationGroup="form_ejm" CssClass="auto-style33"></asp:RequiredFieldValidator></td>
               
                
                <td class="auto-style50" style="border-width: thin; border-style: inherit; border-color: #000000; font-family: Tahoma;">
                   
                   <asp:RangeValidator ID = "rvclass" runat = "server" ControlToValidate = "hi" ErrorMessage = "Hora (0 - 23)" MaximumValue = "23" ForeColor="Red" MinimumValue = "0" Type = "Integer" CssClass="auto-style33" ValidationGroup="form_ejm"> </asp:RangeValidator>
                    <asp:RangeValidator ID = "RangeValidator1" runat = "server" ControlToValidate = "mi" ErrorMessage = "Minutos (0 o 30)" MaximumValue = "30" ForeColor="Red" MinimumValue = "0" Type = "Integer" CssClass="auto-style33" ValidationGroup="form_ejm"> </asp:RangeValidator>
                    <br class="auto-style33" />
                </td>
                <td class="auto-style36" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;" rowspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorfechin0" runat="server" ControlToValidate="TextFechaFin" CssClass="auto-style33" ErrorMessage="*requerido" ForeColor="Red" ValidationGroup="form_ejm"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style59" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;" rowspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorhf" runat="server" ControlToValidate="hf" ErrorMessage="*Hora" ForeColor="Red" ValidationGroup="form_ejm" CssClass="auto-style33"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mf" ErrorMessage="*Minutos" ForeColor="Red" ValidationGroup="form_ejm" CssClass="auto-style33"></asp:RequiredFieldValidator>
                <br class="auto-style33" />

                </td>
                <td class="auto-style38" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;" rowspan="2">
                   <asp:RequiredFieldValidator ID="rfvcandidate" 
               runat="server" ControlToValidate ="Listsum"
               ErrorMessage="Por favor seleccione un suministro" 
               InitialValue="Por favor seleccione un suministro" CssClass="auto-style47">
            </asp:RequiredFieldValidator> <br />
                </td>
                <td class="auto-style56" style="border-width: thin; border-color: #000000; border-style: inherit; font-family: Tahoma;" rowspan="2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="Ltssumin" CssClass="auto-style33" ErrorMessage="*requerido" ForeColor="Red" ValidationGroup="form_ejm"></asp:RequiredFieldValidator>
                    <br />
                    &nbsp;<asp:Button ID="guardar3" runat="server" Text="Todo" ValidationGroup="form_ejm"  />
                </td>
            </tr>
            <tr>
                <td class="auto-style61" colspan="2" style="border-width: thin; border-style: inherit; border-color: #000000; font-family: Tahoma;"><strong>
                    <asp:Label ID="Label8" runat="server" CssClass="auto-style60"></asp:Label>
                    
                    </strong></td>
            </tr>
        </table>
        </asp:Panel>
   
           


        <asp:Panel ID="Paneldisponible" runat="server">





            <strong>
            <asp:Label ID="Label6" runat="server" CssClass="auto-style41"></asp:Label>
            &nbsp;<asp:Label ID="Label7" runat="server" CssClass="auto-style60"></asp:Label>
            <br />
            <br />
            <asp:SqlDataSource ID="SQLDISPO" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT HCNFOLIO.HCNFECCONF AS 'Fecha folio', HCNFOLIO.HCNUMFOL AS 'N° Fol', CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urgencias' ELSE (SELECT TOP 1 HPNDEFCAM.HCACODIGO FROM HPNDEFCAM WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM ORDER BY HPNDEFCAM.OID DESC) END AS Sitio, GENPACIEN.PACNUMDOC AS 'Documento', GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS 'Paciente', CAST(DATEDIFF(dd, GENPACIEN.GPAFECNAC, GETDATE()) / 365.25 AS int) AS 'Edad', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291 OR HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN HCNSOLPNQX.OID ELSE HCNMEDPAC.OID END AS 'Solicitud', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN GENSERIPS.SIPCODIGO ELSE GENSERIPS2.SIPCODIGO END AS 'Codigo', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN GENSERIPS.SIPNOMBRE ELSE GENSERIPS2.SIPNOMBRE END AS 'Nombre', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN HCNSOLPNQX.HCSOBSERV ELSE HCNMEDPAC.HCSOBSERV END AS 'Observaciòn', GENDETCON.GDECODIGO AS 'Regimen', GENDETCON.GDENOMBRE AS 'Entidad' FROM HCNFOLIO LEFT OUTER JOIN HCNSOLPNQX ON HCNFOLIO.OID = HCNSOLPNQX.HCNFOLIO LEFT OUTER JOIN HCNMEDPAC ON HCNFOLIO.OID = HCNMEDPAC.HCNFOLIO LEFT OUTER JOIN GENSERIPS ON HCNSOLPNQX.GENSERIPS = GENSERIPS.OID LEFT OUTER JOIN GENSERIPS AS GENSERIPS2 ON HCNMEDPAC.GENSERIPS = GENSERIPS2.OID INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID AND ADNINGRESO.AINESTADO = 0 INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID WHERE (ADNINGRESO.AINCONSEC = @Ingreso) AND (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291 OR HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) AND (1 = 1) AND (CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291 OR HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN HCNSOLPNQX.OID ELSE HCNMEDPAC.OID END &lt;&gt; @SOLICITUD) OR (ADNINGRESO.AINCONSEC = @Ingreso) AND (HCNMEDPAC.GENSERIPS BETWEEN 5284 AND 5291) AND (1 = 1) AND (CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291 OR HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN HCNSOLPNQX.OID ELSE HCNMEDPAC.OID END &lt;&gt; @SOLICITUD) OR (ADNINGRESO.AINCONSEC = @Ingreso) AND (HCNMEDPAC.GENSERIPS BETWEEN 5507 AND 5508) AND (1 = 1) AND (CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291 OR HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN HCNSOLPNQX.OID ELSE HCNMEDPAC.OID END &lt;&gt; @SOLICITUD) ORDER BY 'N° Fol'">
                <SelectParameters>
                    <asp:ControlParameter ControlID="LbIngreso" Name="Ingreso" PropertyName="Text" />
                    <asp:ControlParameter ControlID="LbSoliclitud" Name="Solicitud" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
           
            <div class="auto-style74">
            </div>
           
            </strong>






        <br />



            <strong class="nuevoEstilo1">Suministrado</strong><br />
            </div>
        <asp:GridView ID="GridViewHistorial" Font-Names="TAHOMA" runat="server" DataSourceID="SqlHistorial" AllowSorting="True" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                <asp:BoundField DataField="Fecha_Folio" HeaderText="Fecha_Folio" SortExpression="Fecha_Folio" />
                <asp:BoundField DataField="Forma_Admin" HeaderText="Forma_Admin" ReadOnly="True" SortExpression="Forma_Admin" />
                <asp:BoundField DataField="Inicio" HeaderText="Inicio" ReadOnly="True" SortExpression="Inicio" />
                <asp:BoundField DataField="Termina" HeaderText="Termina" SortExpression="Termina" ReadOnly="True" />
                <asp:BoundField DataField="Horas" HeaderText="Horas" SortExpression="Horas" ReadOnly="True" />
                <asp:BoundField DataField="Lts x Min" HeaderText="Lts x Min" SortExpression="Lts x Min" />
                <asp:BoundField DataField="Realizo" HeaderText="Realizo" SortExpression="Realizo" />
                <asp:BoundField DataField="Fecha Registro" HeaderText="Fecha Registro" SortExpression="Fecha Registro" />
            </Columns>
        </asp:GridView>
        <br />

        <br />
        <asp:SqlDataSource ID="SqlHistorial" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Folio, Fecha_Folio, (SELECT Nombre FROM O2_Forma_Sum WHERE (Id = O2_Sum_Paciente.Sum_Id)) AS Forma_Admin, Fecha_Ini + ' ' + Hora_Ini AS Inicio, Fecha_Fin + ' ' + Hora_Fin AS Termina, CAST(CAST(Minutos AS DECIMAL(10, 1)) / CAST(60 AS DECIMAL(10, 1)) AS DECIMAL(10, 1)) AS Horas, Litros AS 'Lts x Min', Usuario AS Realizo, Fech_Aud AS 'Fecha Registro' FROM O2_Sum_Paciente WHERE (Ingreso = @Ingreso) AND (Sum_Id &lt;&gt; 0) and (Hora_Fin <> '0') ORDER BY MONTH(  CONVERT (datetime,(O2_Sum_Paciente.Fecha_Ini + ' ' + O2_Sum_Paciente.Hora_Ini) , 103))">
            <SelectParameters>
                <asp:ControlParameter ControlID="LbIngreso" Name="Ingreso" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
       
      
      </asp:Panel>

          


     <asp:Button ID="Button2" runat="server" Text="Continuar" Enabled="true" />
      <br />
        <br />
        <br />
        <div>
           <br />
            <br />
            <div class="auto-style14"><strong>Ing Diego A</strong><br />
            </div>
        </div>

</asp:Content>


