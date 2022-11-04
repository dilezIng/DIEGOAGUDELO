<%@ Page Title="Administración de Oxigeno" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="RegOxigeno.aspx.vb" Inherits="RegOxigeno2" %>


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
        }
        .auto-style3 {
            color: #FFFFFF;
            background-color: #75B2E2;
        }
        .auto-style12 {
            font-size: medium;
        }
        .auto-style14 {
            background-color: #FFFFFF;
        }
        .auto-style41 {
            font-size: medium;
            color: #FF0000;
        }
        .auto-style46 {
            font-size: medium;
            color: #000000;
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
        .auto-style60 {
            font-size: medium;
            color: #0000FF;
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
            <td colspan="4" class="auto-style1" ><span class="auto-style53">SUMINISTRO DE OXIG</span><span class="auto-style52">ENO PENDIENTE DE TERMINAR REGISTRO&nbsp;&nbsp; <asp:Label ID="LabelPacientes" runat="server" CssClass="auto-style54"></asp:Label>
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
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
       
                    &nbsp;</td>
            
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
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridEstancia0" 
                    AutoGenerateColumns="False" Font-Names="Tahoma"
                    AllowSorting="True" Width="98%" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION" DataKeyNames="Ingreso">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
                          <asp:CommandField ShowSelectButton="True" />
                       
                         <asp:BoundField DataField="Ingreso" HeaderText="Ingreso" 
                            SortExpression="Ingreso" >
                        </asp:BoundField>
                       
                        <asp:BoundField DataField="Sitio" HeaderText="Sitio" 
                            SortExpression="Sitio" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Paciente" HeaderText="Paciente" 
                            SortExpression="Paciente" >
                        </asp:BoundField>

                         <asp:BoundField DataField="Nombre_Paciente" HeaderText="Nombre_Paciente" 
                            SortExpression="Nombre_Paciente" >
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridEstancia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
 SelectCommand="SELECT DISTINCT ADNINGRESO.AINCONSEC AS 'Ingreso', HCNFOLIO.HCNFECCONF AS 'Fecha folio', HCNFOLIO.HCNUMFOL AS 'N° Fol', CASE WHEN ADNINGRESO.HPNDEFCAM IS NULL THEN 'Urgencias' ELSE (SELECT TOP 1 HPNDEFCAM.HCACODIGO FROM HPNDEFCAM WHERE HPNDEFCAM.OID = ADNINGRESO.HPNDEFCAM ORDER BY HPNDEFCAM.OID DESC) END AS Sitio, GENPACIEN.PACNUMDOC AS 'Documento', GENPACIEN.PACPRIAPE + N' ' + GENPACIEN.PACSEGAPE + N' ' + GENPACIEN.PACPRINOM + N' ' + GENPACIEN.PACSEGNOM AS 'Paciente', CAST(DATEDIFF(dd, GENPACIEN.GPAFECNAC, GETDATE()) / 365.25 AS int) AS 'Edad', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291 OR HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN HCNSOLPNQX.OID ELSE HCNMEDPAC.OID END AS 'Solicitud', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN GENSERIPS.SIPCODIGO ELSE GENSERIPS2.SIPCODIGO END AS 'Codigo', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN GENSERIPS.SIPNOMBRE ELSE GENSERIPS2.SIPNOMBRE END AS 'Nombre', CASE WHEN (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) THEN HCNSOLPNQX.HCSOBSERV ELSE HCNMEDPAC.HCSOBSERV END AS 'Observaciòn', GENDETCON.GDECODIGO AS 'Regimen', GENDETCON.GDENOMBRE AS 'Entidad' FROM HCNFOLIO LEFT OUTER JOIN HCNSOLPNQX ON HCNFOLIO.OID = HCNSOLPNQX.HCNFOLIO LEFT OUTER JOIN HCNMEDPAC ON HCNFOLIO.OID = HCNMEDPAC.HCNFOLIO LEFT OUTER JOIN GENSERIPS ON HCNSOLPNQX.GENSERIPS = GENSERIPS.OID LEFT OUTER JOIN GENSERIPS AS GENSERIPS2 ON HCNMEDPAC.GENSERIPS = GENSERIPS2.OID INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID AND ADNINGRESO.AINESTADO = 0 INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID WHERE (HCNSOLPNQX.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNSOLPNQX.GENSERIPS BETWEEN 5507 AND 5508) OR (HCNMEDPAC.GENSERIPS BETWEEN 5284 AND 5291) OR (HCNMEDPAC.GENSERIPS BETWEEN 5507 AND 5508) ORDER BY sitio, 'Documento', 'N° Fol'"
                    
                    
                    
                    >
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="DataGridEstancia0" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT DISTINCT Ingreso, MIN(Sitio) AS Sitio, Paciente, Nombre_Paciente FROM O2_Sum_Paciente WHERE (Hora_Fin = '0') GROUP BY Ingreso, Paciente, Nombre_Paciente ORDER BY Ingreso DESC"></asp:SqlDataSource>
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
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="Dat" DataKeyNames="Solicitud" Font-Names="Tahoma">
            <Columns>
                <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" />
                <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                <asp:BoundField DataField="Fecha_Folio" HeaderText="Fecha_Folio" SortExpression="Fecha_Folio" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                <asp:BoundField DataField="Suministro" HeaderText="Suministro Pendiente" SortExpression="Suministro" />
                <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Dat" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Solicitud, Folio, Fecha_Folio, Codigo, Suministro, Observacion FROM O2_Sum_Paciente WHERE (Ingreso = @Ingreso) AND (Hora_Fin='0')">
            <SelectParameters>
                <asp:ControlParameter ControlID="LbIngreso" Name="Ingreso" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
      
        
              
        </asp:Panel>
        <br />
      
        
        
   
           


        <asp:Panel ID="Paneldisponible" runat="server">





            <strong>
            <asp:Label ID="Label6" runat="server" CssClass="auto-style41"></asp:Label>
            &nbsp;<asp:Label ID="Label7" runat="server" CssClass="auto-style60"></asp:Label>
            <br />
            <br />
           
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
        <asp:SqlDataSource ID="SqlHistorial" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Folio, Fecha_Folio, (SELECT Nombre FROM O2_Forma_Sum WHERE (Id = O2_Sum_Paciente.Sum_Id)) AS Forma_Admin, Fecha_Ini + ' ' + Hora_Ini AS Inicio, Fecha_Fin + ' ' + Hora_Fin AS Termina, CAST(CAST(Minutos AS DECIMAL(10, 1)) / CAST(60 AS DECIMAL(10, 1)) AS DECIMAL(10, 1)) AS Horas, Litros AS 'Lts x Min', Usuario AS Realizo, Fech_Aud AS 'Fecha Registro' FROM O2_Sum_Paciente WHERE (Ingreso = @Ingreso) AND (Sum_Id &lt;&gt; 0) ORDER BY Month(Fecha_Ini + ' ' + Hora_Ini )">
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


