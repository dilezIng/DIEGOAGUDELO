<%@ Page Title="HONORARIOS QX" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="ayudantia.aspx.vb" Inherits="ayudantia" %>

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


    <table style="width: 70%; font-family: tahoma;" >
        <tr>
            <td colspan="4" style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('/Images/Fondo01.jpg');">HONORARIOS QX</td>
        </tr>
        <tr>
            <td>Inicio</td> <td class="auto-style1">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                  <asp:MaskedEditExtender ID="TextBox1_MaskedEditExtender" runat="server" 
                    Mask="99/99/9999" MaskType="Date" TargetControlID="TextBox1" 
                    UserDateFormat="DayMonthYear">
                </asp:MaskedEditExtender>
                <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                    TargetControlID="TextBox1">
                </asp:CalendarExtender>



            </td>
            <td >Fin</td> <td class="auto-style1">
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
			
		Tipo:<asp:DropDownList ID="Listtipo" runat="server">
                    <asp:ListItem Selected="True" Value="2">CIRUJANO O GINECOOBSTETRA</asp:ListItem>
					     <asp:ListItem Selected="false" Value="3">ANESTESIOLOGO</asp:ListItem>
						      <asp:ListItem Selected="false" Value="4">AYUDANTIA QUIRURGICA</asp:ListItem>
                </asp:DropDownList>
			
                <asp:Button ID="Button1" runat="server" Text="Buscar" />  
				   <asp:Button ID="BtnExportar" runat="server" Text="Exportar" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT 
ADNINGRESO.AINCONSEC AS 'INGRESO'


,(SELECT CASE WHEN (Select G.GASCODIGO from GENARESER as g where G.OID= (SELECT  top 1 HCNFOLIO.GENARESER FROM  HCNFOLIO
INNER JOIN HCNFOLORDSRV ON HCNFOLIO.OID =HCNFOLORDSRV.HCNFOLIO
WHERE HCNFOLORDSRV.SLNORDSER=SLNORDSER.OID order by HCNFOLORDSRV.HCNFOLIO desc))  IS NULL 
THEN (Select G.GASCODIGO  from GENARESER as g where G.OID= SLNORDSER.GENARESER1)  
ELSE (Select G.GASCODIGO from GENARESER as g where G.OID= (SELECT  top 1 HCNFOLIO.GENARESER FROM  HCNFOLIO
INNER JOIN HCNFOLORDSRV ON HCNFOLIO.OID =HCNFOLORDSRV.HCNFOLIO
WHERE HCNFOLORDSRV.SLNORDSER=SLNORDSER.OID order by HCNFOLORDSRV.HCNFOLIO desc)) END )as 'Area de Servicio',
(SELECT CASE WHEN (Select G.GASCODIGO from GENARESER as g where G.OID= (SELECT  top 1 HCNFOLIO.GENARESER FROM  HCNFOLIO
INNER JOIN HCNFOLORDSRV ON HCNFOLIO.OID =HCNFOLORDSRV.HCNFOLIO
WHERE HCNFOLORDSRV.SLNORDSER=SLNORDSER.OID order by HCNFOLORDSRV.HCNFOLIO desc))  IS NULL 
THEN (Select G.GASNOMBRE  from GENARESER as g where G.OID= SLNORDSER.GENARESER1)  
ELSE (Select G.GASNOMBRE from GENARESER as g where G.OID= (SELECT  top 1 HCNFOLIO.GENARESER FROM  HCNFOLIO
INNER JOIN HCNFOLORDSRV ON HCNFOLIO.OID =HCNFOLORDSRV.HCNFOLIO
WHERE HCNFOLORDSRV.SLNORDSER=SLNORDSER.OID order by HCNFOLORDSRV.HCNFOLIO desc)) END )as  'Cod Area de Servicio'
 ,GENSERIPS.SIPCODIGO AS 'COD PROCEDIMIENTO (GENSERIPS1)'
,GENSERIPS.SIPNOMBRE AS 'PROCEDIMIENTO (NOMGENSERIPS1)'
,G2.SIPCODIGO AS 'COD CLASE DE SERVICIO '
,G2.SIPNOMBRE AS 'NOM CLASE DE SERVICIO'
,GEEDESCRI as Especialidad
,GENGRUQUI.SGQCODIGO as 'COD GRUPO QX'
	  ,GENGRUQUI.SGQNOMBRE as 'GRUPO QX'
	  ,SLNPAQHOJ.SPHTOTENT AS 'VALOR ENTIDAD'
	  ,SLNPAQHOJ.SPHTOTPAC AS 'VALOR PACIENTE'
	  ,SLNPAQHOJ.SPHCOSSER AS 'COSTO DEL SERVICIO'
	  ,SLNPAQHOJ.SPHAJUPAC AS 'VALOR AJUSTADO'
	  ,SLNPAQHOJ.SPHUVRFAC AS 'VALOR UVR / FACTOR'
  	 ,CONVERT(decimal(11, 0),  SLNSERPRO.SERVALPRO)  AS 'Valor Unitario PROCEDIMIENTO', 
CAST(SLNSERPRO.SERCANTID AS DECIMAL(10 , 0))AS Candtidad,
CONVERT(decimal(11, 0), SLNSERPRO.SERVALENT *  SLNSERPRO.SERCANTID) AS 'Valor TotServicio PROCEDIMIENTO',
CAST(SLNSERPRO.SERVALENT AS DECIMAL(10 , 0)) as 'Valor Entidad PROCEDIMIENTO',
CAST(SLNSERPRO.SERVALPAC AS DECIMAL(10 , 0)) as 'Valor Paciente PROCEDIMIENTO',
	 
GENPACIEN.PACNUMDOC AS DocPaciente,
GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS Paciente


  FROM GENPAQUET
inner join GENSERIPS ON  GENPAQUET.GENSERIPS1=GENSERIPS.OID
INNER JOIN GENSERIPS G2 ON GENPAQUET.GENSERIPS2=G2.OID
INNER JOIN SLNPAQHOJ ON GENPAQUET.OID=SLNPAQHOJ.GENPAQUET1
INNER JOIN SLNSERHOJ ON SLNPAQHOJ.SLNSERHOJ1=SLNSERHOJ.OID
INNER JOIN SLNSERPRO ON SLNSERHOJ.OID=SLNSERPRO.OID 
INNER JOIN SLNORDSER ON  SLNSERPRO.SLNORDSER1 = SLNORDSER.OID 
INNER JOIN ADNINGRESO ON SLNSERPRO.ADNINGRES1=ADNINGRESO.OID
inner join GENESPMED on SLNSERPRO.GENMEDICO1=GENESPMED.MEDICOS
inner join GENESPECI on GENESPMED.ESPECIALIDADES=GENESPECI.OID
INNER JOIN GENPACIEN ON  ADNINGRESO.GENPACIEN =GENPACIEN.OID 
 
inner join GENMANSER on SLNSERHOJ.GENMANSER1= GENMANSER.OID
INNER JOIN GENGRUQUI ON GENMANSER.GENGRUQUI1=GENGRUQUI.OID


  WHERE  G2.SIPCLASER =@Listtipo  AND SLNORDSER.SOSESTADO in (0,1) AND(ADNINGRESO.AINFECING BETWEEN CONVERT (DATETIME, @res, 102) AND CONVERT (DATETIME, @res2 + ' 23:59:00', 102))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="res" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox2" Name="res2" PropertyName="Text" />
						 <asp:ControlParameter ControlID="Listtipo" Name="Listtipo" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3"> </td>
        </tr>
    </table>                           

                <br />
				
				 <table style="width: 100%; font-family: tahoma;">
                        
                        </tr>
                            <tr>
                                <td style="width: 90%; font-size: 10pt;">
                <asp:GridView ID="GridView1"    runat="server" AllowSorting="True" DataSourceID="SqlDataSource1" Width="80%" AutoGenerateColumns="False">
                    <Columns>
					
<asp:BoundField   DataField="INGRESO" HeaderText="INGRESO" SortExpression="INGRESO" />

<asp:BoundField   DataField="Area de Servicio" HeaderText="Area de Servicio" SortExpression="Area de Servicio"/>
<asp:BoundField   DataField="Cod Area de Servicio" HeaderText="Cod Area de Servicio" SortExpression="Cod Area de Servicio"/>
<asp:BoundField   DataField="COD PROCEDIMIENTO (GENSERIPS1)" HeaderText="COD PROCEDIMIENTO (GENSERIPS1)" SortExpression="COD PROCEDIMIENTO (GENSERIPS1)"/>
<asp:BoundField   DataField="PROCEDIMIENTO (NOMGENSERIPS1)" HeaderText="PROCEDIMIENTO (NOMGENSERIPS1)" SortExpression="PROCEDIMIENTO (NOMGENSERIPS1)"/>
<asp:BoundField   DataField="COD CLASE DE SERVICIO " HeaderText="COD CLASE DE SERVICIO " SortExpression="COD CLASE DE SERVICIO "/>
<asp:BoundField   DataField="NOM CLASE DE SERVICIO" HeaderText="NOM CLASE DE SERVICIO" SortExpression="NOM CLASE DE SERVICIO"/>
<asp:BoundField   DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad"/>
<asp:BoundField   DataField="COD GRUPO QX" HeaderText="COD GRUPO QX" SortExpression="COD GRUPO QX"/>
<asp:BoundField   DataField="GRUPO QX" HeaderText="GRUPO QX" SortExpression="GRUPO QX"/>
<asp:BoundField   DataField="VALOR ENTIDAD" HeaderText="VALOR ENTIDAD" SortExpression="VALOR ENTIDAD"/>
<asp:BoundField   DataField="VALOR PACIENTE" HeaderText="VALOR PACIENTE" SortExpression="VALOR PACIENTE"/>
<asp:BoundField   DataField="COSTO DEL SERVICIO" HeaderText="COSTO DEL SERVICIO" SortExpression="COSTO DEL SERVICIO"/>
<asp:BoundField   DataField="VALOR AJUSTADO" HeaderText="VALOR AJUSTADO" SortExpression="VALOR AJUSTADO"/>
<asp:BoundField   DataField="VALOR UVR / FACTOR" HeaderText="VALOR UVR / FACTOR" SortExpression="VALOR UVR / FACTOR"/>
<asp:BoundField   DataField="Valor Unitario PROCEDIMIENTO" HeaderText="Valor Unitario PROCEDIMIENTO" SortExpression="Valor Unitario PROCEDIMIENTO"/>
<asp:BoundField   DataField="Candtidad" HeaderText="Candtidad" SortExpression="Candtidad"/>
<asp:BoundField   DataField="Valor TotServicio PROCEDIMIENTO" HeaderText="Valor TotServicio PROCEDIMIENTO" SortExpression="Valor TotServicio PROCEDIMIENTO"/>
<asp:BoundField   DataField="Valor Entidad PROCEDIMIENTO" HeaderText="Valor Entidad PROCEDIMIENTO" SortExpression="Valor Entidad PROCEDIMIENTO"/>
<asp:BoundField   DataField="Valor Paciente PROCEDIMIENTO" HeaderText="Valor Paciente PROCEDIMIENTO" SortExpression="Valor Paciente PROCEDIMIENTO"/>
<asp:BoundField   DataField="DocPaciente" HeaderText="DocPaciente" SortExpression="DocPaciente"/>
<asp:BoundField   DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente"/>

                        
                    </Columns>
                </asp:GridView>
                    <br />
                                </td>
                        </tr>
                    </table>
           

</asp:Panel>




</asp:Content>
