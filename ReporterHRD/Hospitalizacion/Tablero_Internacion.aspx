<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="~/Hospitalizacion/Tablero_Internacion.aspx.vb" Inherits="Tablero_Internacion" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

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
        text-align: center;
    }
           
    .auto-style2 {
        width: 32%;
    }
           
    .auto-style3 {
    }
    .auto-style4 {
        width: 5%;
    }
           
    .auto-style5 {
        width: 17%;
    }
           
    .auto-style8 {
        text-align: left;
    }
           
    .auto-style9 {
        width: 32%;
        font-size: xx-small;
    }
           
    .auto-style11 {
        text-align: center;
    }
           
    .auto-style12 {
        color: #FF0000;
    }
               
    .auto-style13 {
        font-size: x-large;
        color: #FFFFFF;
        background-color: #71BDF9;
    }
               
    .auto-style14 {
        color: #FFFFFF;
    }
               
    .auto-style15 {
        font-size: small;
    }
    .auto-style16 {
        text-align: center;
        width: 107px;
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

    <asp:Panel ID="Panel1" runat="server">
                <table style="width: 100%; font-family: tahoma;" >
        <tr style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');">
            <td colspan="4" class="auto-style1" >TABLERO INTERNACION&nbsp; <asp:Label runat="server" ID="LabelPacientes"></asp:Label>


            </td>

        </tr>

        <tr >
            
            <td  
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style2" >
                
                0 A 2 DIAS:<asp:Image ID="Image9" runat="server" Height="15px" ImageUrl="~/Images/Verde.jpg" />
            </td>
            <td style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; " class="auto-style8" rowspan="3" >

                &nbsp;</td>
            <td style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style3" colspan="2" rowspan="3" >
              
                <div class="auto-style8">
                    &nbsp;Grupo de Camas:<strong><asp:DropDownList ID="GrupoCama" runat="server" AutoPostBack="True" CssClass="auto-style13" DataSourceID="SqlDataGrupos" DataTextField="HGRCODIGO" DataValueField="OID">
                    </asp:DropDownList>
                    </strong>
                </div>
                <asp:SqlDataSource ID="SqlDataGrupos" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT HGRCODIGO, OID FROM HPNGRUPOS"></asp:SqlDataSource>
            </td>
                <td style="width: 20%; font-size: 9pt; text-align: center;" >
       
        <asp:Button ID="BtnConsulta" runat="server" Text="1 Consultar" style="height: 26px" />
		 <asp:Button ID="BtnExportar" runat="server" Text="2 Exportar a Excel" style="height: 26px" /></td>
            
        </tr>
        <tr >
            <td 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style2" >
              
                3 A 5 DIAS:<asp:Image ID="Image10" runat="server" Height="15px" ImageUrl="~/Images/Amarillo.jpg" />
            </td>
          
        </tr>
        <tr >
            <td 
                style=" border: 1px solid #CCCCCC; background-color: #F0F0F0; text-align: right;" class="auto-style2" >
              
                6 o + DIAS:<asp:Image ID="Image11" runat="server" Height="15px" ImageUrl="~/Images/Rojo.jpg" />
            </td>
          
        </tr>
        <tr >
            <td colspan="4" 
                style="text-align: right; font-size: 8pt;" >
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT        HCACODIGO AS Cama, 
                         CASE WHEN HCAESTADO = 0 THEN ' Ninguno' WHEN HCAESTADO = 1 THEN ' Desocupada' WHEN HCAESTADO = 2 THEN 'Ocupada' WHEN HCAESTADO = 3 THEN ' Bloqueada' WHEN HCAESTADO = 4 THEN '  Desbloqueada' WHEN
                          HCAESTADO = 5 THEN '  Mantenimiento ' WHEN HCAESTADO = 6 THEN '  Inactiva' END AS Estado,
                             (SELECT        TOP (1) HESFECSAL
                               FROM            HPNESTANC
                               WHERE        (HPNDEFCAM = HPNDEFCAM.OID)
                               ORDER BY OID DESC) AS 'Ultimo Egreso', DATEDIFF(Mi,
                             (SELECT        TOP (1) HESFECSAL
                               FROM            HPNESTANC AS HPNESTANC_1
                               WHERE        (HPNDEFCAM = HPNDEFCAM.OID)
                               ORDER BY OID DESC), GETDATE()) / 60 AS 'Horas Libre'
FROM            HPNDEFCAM
WHERE        (HCAESTADO in (1,5)) AND (HPNGRUPOS = @Grupo)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GrupoCama" Name="Grupo" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="auto-style16">
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CssClass="auto-style15" DataSourceID="SqlDataSource1" Width="417px" AllowSorting="True">
                        <AlternatingRowStyle BackColor="#F7F9FE" />
                        <Columns>
                            <asp:BoundField DataField="Cama" HeaderText="Cama" SortExpression="Cama"  >
                            </asp:BoundField>
                            <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" SortExpression="Estado" />
                            <asp:BoundField DataField="Ultimo Egreso" HeaderText="Ultimo Egreso" ReadOnly="True" SortExpression="Ultimo Egreso" />
                            <asp:BoundField DataField="Horas Libre" HeaderText="Horas Libre" ReadOnly="True" SortExpression="Horas Libre" />
                        </Columns>
                    </asp:GridView>
                </div>
                <br />
            </td>
        </tr>
        <tr >
            <td colspan="4" style="font-size: 9pt" >
                
                <asp:GridView ID="GridView1" runat="server" DataSourceID="DataGridEstancia" 
                    AutoGenerateColumns="False" 
                    AllowSorting="True" Width="105%" PageSize="300" 
                    EmptyDataText="NO HAY INFORMACION PARA LA SELECCION" DataKeyNames="Ingreso">
                    <AlternatingRowStyle BackColor="#F0F0F0" />
                    <Columns>
<asp:CommandField ShowSelectButton="True" SelectText="Ver" />
<asp:ImageField DataImageUrlField="Semaforo"  HeaderText="Semaforo"><ControlStyle Height="100%" Width="100%" /> </asp:ImageField>
<asp:BoundField DataField="Cama" HeaderText="Cama"  SortExpression="Cama" >      </asp:BoundField>
<asp:BoundField DataField="Documento" HeaderText="Documento"  SortExpression="Documento" > </asp:BoundField>
<asp:BoundField DataField="Nombre" HeaderText="Nombre"        SortExpression="Nombre" ReadOnly="True" >    </asp:BoundField>
<asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" ReadOnly="True" > </asp:BoundField>
<asp:BoundField DataField="Ingreso" HeaderText="Ingreso"    SortExpression="Ingreso" > </asp:BoundField>
<asp:BoundField DataField="Hospitalizacion" HeaderText="Hospitalizacion" SortExpression="Hospitalizacion" />
<asp:BoundField DataField="D_Hosp" HeaderText="D_Hosp" SortExpression="D_Hosp" ReadOnly="True" /> 
<asp:BoundField DataField="Entidad" HeaderText="Entidad" SortExpression="Entidad" />
<asp:BoundField DataField="Diagnostico" HeaderText="Diagnostico" ReadOnly="True" SortExpression="Diagnostico" />
<asp:BoundField DataField="Especialidad" HeaderText="Especialidad" ReadOnly="True" SortExpression="Especialidad" />  
<asp:BoundField DataField="Indicación" HeaderText="Indicación" ReadOnly="True" SortExpression="Indicación" > <ControlStyle Font-Size="XX-Small" /> </asp:BoundField>
<asp:BoundField DataField="Ref" HeaderText="Ref" ReadOnly="True" SortExpression="Ref" />                  
<asp:BoundField DataField="Interconsulta" HeaderText="Inter" ReadOnly="True" SortExpression="Interconsulta" > <ControlStyle Font-Size="XX-Small" />   </asp:BoundField>
<asp:BoundField DataField="Lab" HeaderText="Lab" ReadOnly="True" SortExpression="Lab" > <ControlStyle Font-Size="XX-Small" /> </asp:BoundField>
<asp:BoundField DataField="Imagenes" HeaderText="ImgenDX" ReadOnly="True" SortExpression="Imagenes" > <ControlStyle Font-Size="XX-Small" />  </asp:BoundField>
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="18pt" ForeColor="Red" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataGridEstancia" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" 
 SelectCommand="SELECT DISTINCT CASE WHEN Abs(DateDiff(D , C.AINFECHOS , GetDate())) &lt;= 2 THEN '~/Images/Verde.png' WHEN Abs(DateDiff(D , C.AINFECHOS , GetDate())) &lt;= 4 THEN '~/Images/Amarillo.png' ELSE '~/Images/Rojo.png' END AS Semaforo, B.HCACODIGO AS Cama, RIGHT (B.HCACODIGO, 2) AS Grupo, D.PACNUMDOC AS Documento, RTRIM(D.PACPRIAPE) + ' ' + RTRIM(D.PACSEGAPE) + ' ' + RTRIM(D.PACPRINOM) + ' ' + RTRIM(D.PACSEGNOM) AS Nombre, DATEDIFF(year, D.GPAFECNAC, GETDATE()) AS Edad, C.AINCONSEC AS Ingreso, C.AINFECING AS Fech_Ingreso, C.AINFECHOS AS Hospitalizacion, ABS(DATEDIFF(D, C.AINFECING, GETDATE())) AS D_Ingr, ABS(DATEDIFF(D, C.AINFECHOS, GETDATE())) AS D_Hosp, GENDETCON.GDECODIGO + '_' + GENDETCON.GDENOMBRE AS Entidad, (SELECT TOP (1) G.DIANOMBRE FROM HCNFOLIO AS H INNER JOIN HCNDIAPAC AS HC ON H.OID = HC.HCNFOLIO INNER JOIN GENDIAGNO AS G ON HC.GENDIAGNO = G.OID INNER JOIN HCNTIPHIS ON H.HCNTIPHIS = HCNTIPHIS.OID WHERE (H.ADNINGRESO = C.OID) AND (H.HCNTIPHIS = 3) AND (HC.HCPDIAPRIN = 1) ORDER BY H.OID DESC) AS Diagnostico, (SELECT TOP (1) GENESPECI.GEEDESCRI FROM GENESPECI INNER JOIN GENESPMED ON GENESPECI.OID = GENESPMED.ESPECIALIDADES INNER JOIN HCNFOLIO AS H ON GENESPMED.MEDICOS = H.GENMEDICOA INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID WHERE (H.ADNINGRESO = C.OID) AND (H.HCNTIPHIS = 3) ORDER BY GENESPECI.GEEDESCRI DESC) AS Especialidad, (SELECT CASE WHEN HCNINDMED.HCIDETIND IS NULL THEN 'Sin indicación' ELSE HCNINDMED.HCIDETIND END AS Indicación 
  FROM HCNINDMED WHERE (OID = (SELECT TOP (1) HCNFOLIO_2.HCNINDMED FROM HCNFOLIO AS HCNFOLIO_2 INNER JOIN HCNINDMED AS HCNINDMED_2 ON HCNFOLIO_2.OID = HCNINDMED_2.HCNFOLIO INNER JOIN HCNTIPHIS AS HCNTIPHIS_2 ON HCNFOLIO_2.HCNTIPHIS = HCNTIPHIS_2.OID WHERE (HCNFOLIO_2.ADNINGRESO = C.OID) AND (HCNFOLIO_2.HCNTIPHIS = 3) ORDER BY HCNFOLIO_2.OID DESC))) AS Indicación

 ,case when (select count(HCNREFER.oid) From HCNREFER Inner Join HCNFOLIO as hc On hc.OID = HCNREFER.HCNFOLIO where hc.ADNINGRESO = C.OID) is null then 'No' else (select count(HCNREFER.oid) From HCNREFER Inner Join HCNFOLIO as hc On hc.OID = HCNREFER.HCNFOLIO where hc.ADNINGRESO = C.OID) end 'Ref'
,case when (SELECT count(HCNINTERC_1.OID) FROM HCNINTERC AS HCNINTERC_1 INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID  WHERE (HCNINTERC_1.HCNINTERR IS NULL) AND (HCNINTERC_1.HCIREGSUS = 0)and  HC.ADNINGRESO = C.OID)  is null then 'No' else (SELECT count(HCNINTERC_1.OID) FROM HCNINTERC AS HCNINTERC_1 INNER JOIN HCNFOLIO AS HC ON HCNINTERC_1.HCNFOLIO = HC.OID  WHERE (HCNINTERC_1.HCNINTERR IS NULL)AND (HCNINTERC_1.HCIREGSUS = 0) and  HC.ADNINGRESO = C.OID)  end 'Interconsulta'
,(select count(HCNSOLEXA.oid)  FROM HCNSOLEXA  left JOIN LBNORDDET ON  HCNSOLEXA.OID =LBNORDDET.HCNSOLEXA1 INNER JOIN LBNEXAMEN ON LBNORDDET.LBNEXAMEN=LBNEXAMEN.OID left JOIN HCNRESEXA ON LBNORDDET.OID=HCNRESEXA.LBNORDDET where HCNRESEXA.HCRFECINT is null and HCNSOLEXA.ADNINGRESO = C.OID) as 'Lab'
,(select count(HCNSOLEXA.OID) from HCNSOLEXA Inner Join GENSERIPS On GENSERIPS.OID = HCNSOLEXA.GENSERIPS where HCNSOLEXA.HCNRESEXA Is Null and HCNSOLEXA.ADNINGRESO = C.OID and  GENSERIPS.GENARESER1 In ('27', '39', '100', '101', '102') ) as 'Imagenes'


  FROM HPNESTANC AS A INNER JOIN HPNDEFCAM AS B ON A.HPNDEFCAM = B.OID INNER JOIN HPNGRUPOS ON B.HPNGRUPOS = HPNGRUPOS.OID INNER JOIN ADNINGRESO AS C ON A.ADNINGRES = C.OID INNER JOIN GENPACIEN AS D ON C.GENPACIEN = D.OID INNER JOIN HCNFOLIO ON D.OID = HCNFOLIO.GENPACIEN INNER JOIN GENMEDICO ON GENMEDICO.OID = HCNFOLIO.GENMEDICOA INNER JOIN HCNTIPHIS AS HCNTIPHIS_1 ON HCNFOLIO.HCNTIPHIS = HCNTIPHIS_1.OID INNER JOIN GENESPECI AS GENESPECI_1 ON HCNFOLIO.GENESPECI = GENESPECI_1.OID INNER JOIN HPNSUBGRU AS E ON B.HPNSUBGRU = E.OID INNER JOIN GENDETCON ON GENDETCON.OID = C.GENDETCON WHERE (ABS(DATEDIFF(HOUR, C.AINFECING, GETDATE())) &gt;= 0) AND (ABS(DATEDIFF(HOUR, C.AINFECHOS, GETDATE())) &gt;= 0) AND (A.HESFECSAL IS NULL) AND (HPNGRUPOS.OID = @grupo) ORDER BY D_Hosp DESC"
                    
                    
                    
                    >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GrupoCama" Name="grupo" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
                    <tr>
                        <td class="auto-style9">
                          
                            Ing Diego A.</td>
                        <td class="auto-style5">
                            &nbsp;</td>
                        <td class="auto-style4">
                            &nbsp;</td>
                        <td style="width: 25%">
                            &nbsp;</td>
                    </tr>
    </table>

            </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center">

        <strong>
        Ingreso Actual: <asp:Label ID="Ingreso1" runat="server" CssClass="auto-style12"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        </strong>
        <asp:SqlDataSource ID="Folmedi" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT HCNFOLIO.OID AS Folio, HCNFOLIO.HCNUMFOL AS Folios, HCNFOLIO.HCFECFOL AS Fecha, ADNINGRESO.AINCONSEC AS Ingreso, GENPACIEN.PACNUMDOC AS Documento, GENPACIEN.PACPRINOM + ' ' + GENPACIEN.PACSEGNOM + ' ' + GENPACIEN.PACPRIAPE + ' ' + GENPACIEN.PACSEGAPE AS Nombre FROM HCNMEDPAC INNER JOIN HCNFOLIO ON HCNMEDPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID WHERE (ADNINGRESO.AINCONSEC = @ingreso) ORDER BY Folio DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="Ingreso1" Name="ingreso" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button2" runat="server" Text="Regresar" Enabled="true" />
        <br />
        <br />
       <strong><asp:Label ID="Folio1" runat="server" Visible="true" CssClass="auto-style14"></asp:Label>
        </strong><br />
        <div>
           
            <br />
            <asp:SqlDataSource ID="Medicamento" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT HCNFOLIO.HCNUMFOL AS Folio, INNPRODUC.IPRDESCOR AS Nombre, HCNMEDPAC.HCSOBSERV AS Observacion, HCNMEDPAC.HCSFECSOL AS Fecha, HCNMEDPAC.HCSCANTI AS Cantidad, CAST(ROUND(HCNMEDPAC.HCSCANRES, 0, 0) AS INT) AS Suministrado FROM HCNMEDPAC INNER JOIN HCNFOLIO ON HCNMEDPAC.HCNFOLIO = HCNFOLIO.OID INNER JOIN ADNINGRESO ON HCNFOLIO.ADNINGRESO = ADNINGRESO.OID INNER JOIN INNPRODUC ON HCNMEDPAC.INNPRODUC = INNPRODUC.OID WHERE (HCNFOLIO.OID = @idfolio) ORDER BY Folio desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Folio1" Name="idfolio" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="Medicamento" BorderColor="Black" BorderStyle="Solid" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" SortExpression="Cant" />
                    <asp:BoundField DataField="Suministrado" HeaderText="Sumi" ReadOnly="True" SortExpression="Suministrado" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Folio" DataSourceID="Folmedi" BorderColor="Black" BorderStyle="Solid" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="#CCCCCC" BorderColor="Black" />
                <Columns>
                    <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
                    <asp:BoundField DataField="Folios" HeaderText="Folios" SortExpression="Folios" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                  
                    <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                </Columns>
            </asp:GridView>
            <div class="auto-style8">
                Ing Diego A<br />
            </div>
        </div>
        <div class="auto-style11">
            <br />
            <br />
        </div>





    </asp:Panel>

</asp:Content>


