<%@ Page Title="Indicadores de Urgencias" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Urgencias.aspx.vb" Inherits="PaginaBase" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        text-decoration: underline;
    }
    .style2
    {
        text-align: center;
    }
    .modalPopup
    {
        border: 3px solid black;
        background-color: #FFFFFF;
        padding-top: 10px;
        padding-left: 10px;
        }
           
    </style>

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
           
    .auto-style2 {
        width: 242pt;
        height: 43px;
    }
 p.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	}
               
    .auto-style5 {
        height: 31px;
    }
    .auto-style8 {
        width: 15%;
        height: 31px;
    }
               
    .auto-style9 {
        width: 41%;
    }
                   
    .auto-style14 {
        width: 100%;
    }
    .auto-style21 {
        height: 23px;
        width: 75px;
        text-align: center;
    }
    .auto-style22 {
        height: 23px;
        text-align: center;
    }
    .auto-style23 {
        height: 23px;
        width: 116px;
        text-align: center;
    }
               
    .auto-style24 {
        width: 12%;
    }
    .auto-style25 {
        height: 23px;
        text-align: center;
        width: 87px;
    }
    .auto-style26 {
        color: #FF0000;
    }
    .auto-style27 {
        width: 5%;
        height: 62px;
    }
    .auto-style28 {
        width: 25%;
        height: 62px;
    }
    .auto-style29 {
        width: 41%;
        height: 62px;
    }
    .auto-style30 {
        width: 12%;
        height: 62px;
    }
    .auto-style31 {
        width: 15%;
        height: 62px;
    }
    .auto-style34 {
        font-size: medium;
        color: #FF0000;
    }
               
    .auto-style35 {
        font-size: medium;
        color: #0000CC;
    }
    .auto-style36 {
        color: #0000CC;
    }
               
    .auto-style37 {
        text-align: left;
    }
               
    .auto-style38 {
        color: #0000FF;
        background-color: #00FF00;
    }
    .auto-style39 {
        color: #0000FF;
    }
               
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
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
    

    <table style="width: 100%; font-family: tahoma; border: 1px solid #999999; " >
        <tr >
            <td colspan="5" 
                style="font-weight: bold; font-size: 20pt; background-image: url('../Images/Fondo01.jpg');" class="auto-style39" 
                >
                Indicadores Urgencias</td>
        </tr>
        <tr >
            <td style="border: 1px solid #999999; font-size: 10pt;" colspan="2" class="auto-style5" >
                <span class="auto-style39">Seleccione un mes: </span>
                <asp:DropDownList ID="ListMeses" runat="server" AutoPostBack="True" 
                    Width="140px" CssClass="auto-style39">
                </asp:DropDownList>
            </td>
            <td class="auto-style5" colspan="2" >
                <span class="auto-style38">Pacientes urgencias + (Control 72Hrs+retiros voluntarios)&nbsp;: </span>
                <asp:Label ID="LblPacUrgencias22" runat="server" CssClass="auto-style38"></asp:Label>
                &nbsp;<br class="auto-style39" /> <span class="auto-style39">Pacientes Urgencias&nbsp; : </span>
                <asp:Label ID="Lblsumpacientes5" runat="server" CssClass="auto-style39"></asp:Label>
            </td>
            <td class="auto-style8" >
                <asp:Label ID="Label2" runat="server" CssClass="auto-style39"></asp:Label>
            </td>
        </tr>
        <tr >
            <td style="width: 5%; text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;" >1</td>
            <td style="width: 25%; text-align: center; font-weight: bold;" >  Acceso Funcional</td>
            <td style="font-size: 8pt;" class="auto-style9" >
                <span class="style1">Número de pacientes atendidos en triage</span> 
                x 100<br />
 Total personas atendidas en Urgencias</td>
            <td style="border-left: 1px solid #999999;" class="auto-style24" >
                <asp:Label ID="LblPacTriage" runat="server" style="text-decoration: underline"></asp:Label>  x 100,0<br />
                <asp:Label ID="LblPacUrgencias" runat="server"></asp:Label>
            </td>
            <td style="width: 15%" >
                <asp:Label ID="LblTotalAccesoFuncional" runat="server" 
                    style="font-weight: 700; font-size: 15pt"></asp:Label>
            </td>
        </tr>
        <tr >
            <td style="width: 5%; text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;" >
                2</td>
            <td style="width: 25%; text-align: center; font-weight: bold;" >
                Reingreso de pacientes atendidos en Urgencias</td>
            <td style="font-size: 8pt;" class="auto-style9" >
                <span class="style1">Total Reingresos menor a 72hs atendidos en urgencias</span> 
                x 100<br />
 Total pacientes atendidos en Urgencias</td>
            <td style="border-left: 1px solid #999999;" class="auto-style24" >
                
                <asp:Label ID="LblReingresos" runat="server" style="text-decoration: underline"></asp:Label>
 x 100<br />
                <asp:Label ID="LblPacUrgencias0" runat="server"></asp:Label>
            </td>
            <td style="width: 15%" >
                <asp:LinkButton ID="LblTotalReingresos" runat="server"                     style="font-size: 15pt; font-weight: 700" ToolTip="Clic para ver el detalle."></asp:LinkButton>
            </td>
        </tr>
        <tr >
            <td style="width: 5%; text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;" >
                3</td>
            <td style="width: 25%; text-align: center; font-weight: bold;" >
                <p>
                    % Pacientes sin identificador de pagador</p>
            </td>
            <td style="font-size: 8pt;" class="auto-style9" >
                <span class="style1">Numero de pacientes sin identificador de pagador</span> 
                x100<br />
 
                Ingresos por Urgencias</td>
            <td style="border-left: 1px solid #999999;" class="auto-style24" >
                <asp:Label ID="LblPacSinPagador" runat="server" 
                    style="text-decoration: underline"></asp:Label>
 x 100<br />
                <asp:Label ID="LblPacUrgencias1" runat="server"></asp:Label>
            </td>
            <td style="width: 15%" >
                <asp:Label ID="LblPorcSinPagador" runat="server" 
                    style="font-weight: 700; font-size: 15pt"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 5%; text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;">4</td>
            <td style="width: 25%; text-align: center; font-weight: bold;">
                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;" class="auto-style2">
                    <colgroup>
                        <col style="mso-width-source:userset;mso-width-alt:2962;width:61pt" width="81" />
                    </colgroup>
                    <tr height="19" style="height:14.25pt">
                            <td style="width: 25%; text-align: center; font-weight: bold;" >Promedio de tiempo de estancia de todos los pacientes en urgencias</span></td>
                    
                        </tr>
                </table>
            </td>
            <td style="font-size: 8pt;" class="auto-style9"><span class="style1">Sumatoria tiempo ATENCIÓN a partir del ingreso a urgencias hasta el egreso efectivo</span><br /> <span class="auto-style36">Total pacientes atendidas en Urgencias</span></td>
            <td style="border-left: 1px solid #999999;" class="auto-style24">
                <asp:Label ID="LbTiempo" runat="server" CssClass="style1"></asp:Label>
                <br />
                <asp:Label ID="Lblsumpacientes" runat="server" CssClass="auto-style36"></asp:Label>
            </td>
            <td style="width: 15%">
                <table class="auto-style14">
                    <tr>
                        <td class="auto-style23">Min_Prom.</td>
                        <td class="auto-style22">Dias.</td>
                        <td class="auto-style22">Hora.</td>
                        <td class="auto-style21">&nbsp;Min.</td>
                    </tr>
                    <tr>
                        <td class="auto-style23">
                            <asp:Label ID="LblMinprome" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:Label ID="Lbldias" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:Label ID="LblHora" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style21">
                            <asp:Label ID="LblMin" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;" class="auto-style27">5</td>
             <td style="text-align: center; font-weight: bold;" class="auto-style28" >Promedio de tiempo de estancia de los pacientes en urgencias en pasillo</span></td>
            <td style="font-size: 8pt;" class="auto-style29"><span class="style1">Sumatoria tiempo ATENCIÓN a partir del ingreso a urgencias hasta el egreso efectivo que no ingresaron a observación(Pasillo o solamente consulta) </span><br /> <span class="auto-style26">Total pacientes en urgencias en pasillo</span></span></td>
            <td style="border-left: 1px solid #999999;" class="auto-style30">
                <asp:Label ID="LbTiempo0" runat="server" CssClass="style1"></asp:Label>
                <br />
                <asp:Label ID="Lblsumpacientes0" runat="server" CssClass="auto-style26"></asp:Label>
            </td>
            <td class="auto-style31">
                <table class="auto-style14">
                    <tr>
                        <td class="auto-style23">Min_Prom.</td>
                        <td class="auto-style22">&nbsp;Dias.</td>
                        <td class="auto-style25">Hora.</td>
                        <td class="auto-style21">Min.</td>
                    </tr>
                    <tr>
                        <td class="auto-style23">
                            <asp:Label ID="LblMinprome0" runat="server" CssClass="auto-style34" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:Label ID="Lbldias0" runat="server" CssClass="auto-style34" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style25">
                            <asp:Label ID="LblHora0" runat="server" CssClass="auto-style34" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style21">
                            <asp:Label ID="LblMin0" runat="server" CssClass="auto-style34" style="font-weight: 700; "></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 5%; text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;">6</td>
           <td style="width: 25%; text-align: center; font-weight: bold;" >Promedio de tiempo de estancia de los pacientes en unidad de observación de urgencias adultos y pediatría</td>
            <td style="font-size: 8pt;" class="auto-style9"><span class="style1">Sumatoria tiempo ATENCIÓN a partir del ingreso a observación hasta el egreso efectivo en observación(Adultos o Pediatria)</span><br /> <span class="auto-style36">Total pacientes en unidad de observación de urgencias adultos y pediatría</span></td>
            <td style="border-left: 1px solid #999999;" class="auto-style24">
                <asp:Label ID="LbTiempo1" runat="server" CssClass="style1"></asp:Label>
                <br />
                <asp:Label ID="Lblsumpacientes1" runat="server" CssClass="auto-style36"></asp:Label>
            </td>
            <td style="width: 15%">
                <table class="auto-style14">
                    <tr>
                        <td class="auto-style23">Min_Prom.</td>
                        <td class="auto-style22">&nbsp;Dias.</td>
                        <td class="auto-style22">&nbsp;Hora.</td>
                        <td class="auto-style21">Min.</td>
                    </tr>
                    <tr>
                        <td class="auto-style23">
                            <asp:Label ID="LblMinprome1" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:Label ID="Lbldias1" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:Label ID="LblHora1" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style21">
                            <asp:Label ID="LblMin1" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 5%; text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;">7</td>
              <td style="width: 25%; text-align: center; font-weight: bold;" >Promedio de tiempo de estancia de los pacientes en unidad de observación de urgencias adultos</td>
            <td style="font-size: 8pt;" class="auto-style9"><span class="style1">Sumatoria tiempo ATENCIÓN a partir del ingreso a observación hasta el egreso efectivo en observación Adultos</span><br /> <span class="auto-style26">Total pacientes en unidad de observación de urgencias adultos</span></td>
            <td style="border-left: 1px solid #999999;" class="auto-style24">
                <asp:Label ID="LbTiempo2" runat="server" CssClass="style1"></asp:Label>
                <br />
                <asp:Label ID="Lblsumpacientes2" runat="server" CssClass="auto-style26"></asp:Label>
            </td>
            <td style="width: 15%">
                <table class="auto-style14">
                    <tr>
                        <td class="auto-style23">Min_Prom.</td>
                        <td class="auto-style22">&nbsp;Dias.</td>
                        <td class="auto-style22">Hora.</td>
                        <td class="auto-style21">Min.</td>
                    </tr>
                    <tr>
                        <td class="auto-style23">
                            <asp:Label ID="LblMinprome2" runat="server" CssClass="auto-style34" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:Label ID="Lbldias2" runat="server" CssClass="auto-style34" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:Label ID="LblHora2" runat="server" CssClass="auto-style34" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style21">
                            <asp:Label ID="LblMin2" runat="server" CssClass="auto-style34" style="font-weight: 700; "></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 5%; text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;">8</td>
            <td style="width: 25%; text-align: center; font-weight: bold;"><strong>Promedio de Tiempo de Estancia de los Pacientes en Unidad de Observación de Urgencias Pediatría</strong></td>
            <td style="font-size: 8pt;" class="auto-style9"><span class="style1">Sumatoria tiempo ATENCIÓN a partir del ingreso a observación hasta el egreso efectivo en observación Pediatria</span><br /> <span class="auto-style36">Total pacientes en unidad de observación de urgencias pediatría</span></td>
            <td style="border-left: 1px solid #999999;" class="auto-style24">
                <asp:Label ID="LbTiempo3" runat="server" CssClass="style1"></asp:Label>
                <br />
                <asp:Label ID="Lblsumpacientes3" runat="server" CssClass="auto-style36"></asp:Label>
            </td>
            <td style="width: 15%">
                <table class="auto-style14">
                    <tr>
                        <td class="auto-style23">Min_Prom.</td>
                        <td class="auto-style22">&nbsp;Dias.</td>
                        <td class="auto-style25">Hora.</td>
                        <td class="auto-style21">Min.</td>
                    </tr>
                    <tr>
                        <td class="auto-style23">
                            <asp:Label ID="LblMinprome3" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style22">
                            <asp:Label ID="Lbldias3" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style25">
                            <asp:Label ID="LblHora3" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                        <td class="auto-style21">
                            <asp:Label ID="LblMin3" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
		
		  <tr>
            <td style="width: 5%; text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;">9</td>
            <td style="width: 25%; text-align: center; font-weight: bold;"><strong>OPORTUNIDAD EN INGRESO HOSPITALARO</strong></td>
            <td style="font-size: 8pt;" class="auto-style9"><span class="style1">Sumatoria tiempo Horas</span><br /> <span class="auto-style36">Total pacientes</span></td>
            <td style="border-left: 1px solid #999999;" class="auto-style24">
                <asp:Label ID="Lblsumpacientes33" runat="server" CssClass="style1"></asp:Label>
                <br />
                <asp:Label ID="Lblsumpacientes333" runat="server" CssClass="auto-style36"></asp:Label>
            </td>
            <td style="width: 15%">
                <table class="auto-style14">
                    <tr>
                        
                        <td class="auto-style22" colspan="2" >
						     <asp:Label ID="Lblsumpacientes338" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
					</td>
					<td class="auto-style23">
						<asp:Label ID="dd" runat="server" CssClass="auto-style35" style="font-weight: 700; "></asp:Label>
						</td>
                        <td class="auto-style21"></td>
                    </tr>
                    <tr>
                        <td class="auto-style23">
                            
                        </td>
                        <td class="auto-style22">
             
                        </td>
                        <td class="auto-style25">
                          
                        </td>
                        <td class="auto-style21">
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 5%; text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;">&nbsp;</td>
            <td style="font-weight: bold;" class="auto-style37" colspan="2"><strong>Pacientes que pasan de Urgencias a Hospitalizaciòn:
                <asp:Label ID="Lblsumpacientes4" runat="server" CssClass="auto-style36"></asp:Label>
                </strong></td>
            <td class="auto-style24" style="border-left: 1px solid #999999;">&nbsp;</td>
            <td style="width: 15%">&nbsp;</td>
        </tr>
        <tr >
            <td style="text-align: left; font-size: 20pt; font-weight: bold; color: #0000CC;" 
                class="style2" colspan="5" >
                <hr />
                Oportunidad de Atención trimestral por Entidad</td>
        </tr>
        <tr >
            <td style="width: 5%; text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;" >
                </td>
            <td style="width: 25%; text-align: center; font-weight: bold;" >
                <asp:DropDownList ID="ListTrimestres" runat="server" AutoPostBack="True" 
                    Width="140px">
                </asp:DropDownList>
                <asp:Label ID="LabelAñoTrimestre" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="LabelTrimestre" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style9" >
                <asp:DropDownList ID="ListPlanesBenefTrimestres" runat="server" AutoPostBack="True" 
                    Width="140px" DataSourceID="DataPlanBenefTrim" DataTextField="NomEntidad" 
                    DataValueField="IdEntidad" Enabled="False">
                </asp:DropDownList>
                <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                <asp:SqlDataSource ID="DataPlanBenefTrim" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>">
                </asp:SqlDataSource>
            </td>
            <td colspan="2" >
                <asp:GridView ID="GridTriage" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="DataGridTriage">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="HCCODIGO" HeaderText="Nivel" 
                            SortExpression="HCCODIGO" />
                        <asp:BoundField DataField="MinEspera" HeaderText="Min. Espera" ReadOnly="True" 
                            SortExpression="MinEspera" />
                        <asp:BoundField DataField="Consultas" HeaderText="Consultas" ReadOnly="True" 
                            SortExpression="Consultas" />
                        <asp:BoundField DataField="Oportunidad" HeaderText="Oportunidad" 
                            ReadOnly="True" SortExpression="Oportunidad" />
                        <asp:BoundField DataField="Regimen" HeaderText="Regimen" 
                            SortExpression="Regimen" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridTriage" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    SelectCommand="SELECT HCNCLAURGTR.HCCODIGO, COUNT(HCNTRIAGE.HCNCLAURGTR) AS Consultas, CONVERT (decimal(11 , 0), CONVERT (decimal(11 , 1), SUM(DATEDIFF(minute, HCNTRIAGE.HCTFECTRI, HCNFOLIO.HCFECFOLI)))) AS MinEspera, CONVERT (decimal(11 , 2), CONVERT (decimal(11 , 1), SUM(DATEDIFF(minute, HCNTRIAGE.HCTFECTRI, HCNFOLIO.HCFECFOLI))) / COUNT(HCNTRIAGE.HCNCLAURGTR)) AS Oportunidad, CASE WHEN GENPACIEN.GPATIPPAC = 1 THEN 'Contributivo' ELSE CASE WHEN GENPACIEN.GPATIPPAC = 2 THEN 'Subsidiado' ELSE 'Otro' END END AS Regimen FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.ADNINGRESO = ADNINGRESO.OID INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO INNER JOIN HCNCLAURGTR ON HCNTRIAGE.HCNCLAURGTR = HCNCLAURGTR.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (HCNTRIAGE.HCAUSENT = 0) AND (HCNTRIAGE.HCTRETVOLPAC = 0) AND (HCNFOLIO.OID = (SELECT TOP (1) HCNFOLIO_1.OID FROM HCNFOLIO AS HCNFOLIO_1 INNER JOIN GENMEDICO AS GENMEDICO_1 ON HCNFOLIO_1.GENMEDICO = GENMEDICO_1.OID INNER JOIN GENESPECI AS GENESPECI_1 ON HCNFOLIO_1.GENESPECI = GENESPECI_1.OID WHERE (HCNFOLIO_1.ADNINGRESO = ADNINGRESO.OID) ORDER BY HCNFOLIO_1.HCNUMFOL)) AND (DATEPART(q, HCNTRIAGE.HCTFECTRI) = @Trimestre) AND (DATEPART(yyyy, HCNTRIAGE.HCTFECTRI) = @Año) AND (ADNINGRESO.EntidadAdministradora = @Entidad) GROUP BY HCNCLAURGTR.HCCODIGO, CASE WHEN GENPACIEN.GPATIPPAC = 1 THEN 'Contributivo' ELSE CASE WHEN GENPACIEN.GPATIPPAC = 2 THEN 'Subsidiado' ELSE 'Otro' END END ORDER BY HCNCLAURGTR.HCCODIGO">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LabelTrimestre" Name="Trimestre" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelAñoTrimestre" Name="Año" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListPlanesBenefTrimestres" Name="Entidad" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr >
            <td style="width: 100%; " colspan="5" >
                <asp:GridView ID="GridTriagePacs" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="DataGridTriagePacs" PageSize="20" 
                    Width="100%">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                        <asp:BoundField DataField="HCCODIGO" HeaderText="Nivel" 
                            SortExpression="HCCODIGO" />
                        <asp:BoundField DataField="NomPaciente" HeaderText="Paciente" ReadOnly="True" 
                            SortExpression="NomPaciente" />
                        <asp:BoundField DataField="PACNUMDOC" HeaderText="Identificacion" 
                            SortExpression="PACNUMDOC" />
                        <asp:BoundField DataField="PACTELEFONO" HeaderText="Telefono" 
                            SortExpression="PACTELEFONO" />
                        <asp:BoundField DataField="Entidad" HeaderText="Entidad" ReadOnly="True" 
                            SortExpression="Entidad" />
                        <asp:BoundField DataField="HCTMOTCON" HeaderText="Motivo" 
                            SortExpression="HCTMOTCON">
                        <ItemStyle Font-Size="8pt" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Regimen" HeaderText="Regimen" ReadOnly="True" 
                            SortExpression="Regimen" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridTriagePacs" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    SelectCommand="SELECT HCNCLAURGTR.HCCODIGO, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS NomPaciente, GENPACIEN.PACNUMDOC, GENPACIENT.PACTELEFONO, RTRIM(GEENENTADM.ENTNOMBRE) AS Entidad, HCNTRIAGE.HCTMOTCON, CASE WHEN GENPACIEN.GPATIPPAC = 1 THEN 'Contributivo' ELSE CASE WHEN GENPACIEN.GPATIPPAC = 2 THEN 'Subsidiado' ELSE 'Otro' END END AS Regimen, ADNINGRESO.AINCONSEC FROM HCNTRIAGE INNER JOIN ADNINGRESO ON HCNTRIAGE.ADNINGRESO = ADNINGRESO.OID INNER JOIN HCNFOLIO ON ADNINGRESO.OID = HCNFOLIO.ADNINGRESO INNER JOIN HCNCLAURGTR ON HCNTRIAGE.HCNCLAURGTR = HCNCLAURGTR.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GEENENTADM ON ADNINGRESO.EntidadAdministradora = GEENENTADM.OID LEFT OUTER JOIN GENPACIENT ON GENPACIEN.GENPACIENT = GENPACIENT.OID WHERE (HCNTRIAGE.HCAUSENT = 0) AND (HCNTRIAGE.HCTRETVOLPAC = 0) AND (DATEPART(q, HCNTRIAGE.HCTFECTRI) = @Trimestre) AND (DATEPART(yyyy, HCNTRIAGE.HCTFECTRI) = @Año) AND (ADNINGRESO.EntidadAdministradora = @Entidad) GROUP BY HCNCLAURGTR.HCCODIGO, GENPACIEN.PACNUMDOC, GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM, GENPACIENT.PACTELEFONO, RTRIM(GEENENTADM.ENTNOMBRE), HCNTRIAGE.HCTMOTCON, CASE WHEN GENPACIEN.GPATIPPAC = 1 THEN 'Contributivo' ELSE CASE WHEN GENPACIEN.GPATIPPAC = 2 THEN 'Subsidiado' ELSE 'Otro' END END, ADNINGRESO.AINCONSEC ORDER BY HCNCLAURGTR.HCCODIGO, NomPaciente">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LabelTrimestre" Name="Trimestre" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="LabelAñoTrimestre" Name="Año" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="ListPlanesBenefTrimestres" Name="Entidad" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr >
            <td style="text-align: left; " colspan="5" >
                <asp:Button ID="BtnMostrar" runat="server" Enabled="False" Width="10px" />
                <asp:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
                    BackgroundCssClass="modalBackground" CancelControlID="BtnClose" 
                    DynamicServicePath="" Enabled="True" PopupControlID="Panel1" 
                    TargetControlID="BtnMostrar">
                </asp:ModalPopupExtender>
                <asp:Panel ID="Panel1" runat="server" BackColor="White" CssClass="modalPopup" 
                    Height="700px" ScrollBars="Vertical" Width="1100px">
                    <asp:GridView ID="GridDetalleReingresos" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataSourceID="DataGridReingresos" PageSize="50" 
                        Width="100%">
                        <AlternatingRowStyle BackColor="#F0F0F0" />
                        <Columns>
                            <asp:BoundField DataField="Identificador" HeaderText="Triage o Ingreso" 
                                SortExpression="Identificador" />
                            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                            <asp:BoundField DataField="DocPaciente" HeaderText="Doc Paciente" 
                                SortExpression="DocPaciente" />
                            <asp:BoundField DataField="NomPaciente" HeaderText="Nombre Paciente" 
                                ReadOnly="True" SortExpression="NomPaciente" />
                            <asp:BoundField DataField="Edad" HeaderText="Edad" 
                                ReadOnly="True" SortExpression="Edad" />
                            <asp:BoundField DataField="Medico" HeaderText="Medico" 
                                SortExpression="Medico" />
                            <asp:BoundField DataField="Dx" HeaderText="Dx" 
                                SortExpression="Dx" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="DataGridReingresos" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <asp:Button ID="BtnClose" runat="server" Text="Cerrar" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="width: 5%; text-align: right; font-size: 20pt; font-weight: bold; color: #0000CC;">
                </td>
            <td style="width: 25%; text-align: center; font-weight: bold;">
                </td>
            <td class="auto-style9">
                </td>
            <td class="auto-style24">
                </td>
            <td style="width: 15%">
                </td>
        </tr>
    </table>
        
        </ContentTemplate>
    </asp:UpdatePanel>
    

</asp:Content>

