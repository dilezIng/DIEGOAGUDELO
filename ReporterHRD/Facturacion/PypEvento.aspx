<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="PypEvento.aspx.vb" Inherits="Facturacion_PypEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; font-family: tahoma; font-size: 9pt;">
        <tr>
            <td style="width: 25%; vertical-align: top;">
                <asp:RadioButtonList ID="ListSedes" runat="server">
                    <asp:ListItem Selected="True" Value="0">Duitama</asp:ListItem>
                    <asp:ListItem Value="1">Santarosa de Viterbo</asp:ListItem>
                </asp:RadioButtonList>
                <hr />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="0">Por Periodo y Plan</asp:ListItem>
                    <asp:ListItem Value="1">Por numero de Factura</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Panel ID="PanelPeriodo" runat="server" GroupingText="Por Periodo y Plan">
                   
                Seleccione un periodo:
                <br />
                <asp:DropDownList ID="ListMeses" runat="server" AutoPostBack="True">
                </asp:DropDownList>
                <hr />
                Seleccione un Plan de Beneficios:
                <br />
                <asp:DropDownList ID="ListPlanes" runat="server" 
                    DataSourceID="DataPlanesBeneficios" DataTextField="NomPlan" 
                    DataValueField="OID" Width="100%">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataPlanesBeneficios" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    
                        SelectCommand="SELECT DISTINCT GENDETCON.OID, GENDETCON.GDECODIGO + N' ' + GENDETCON.GDENOMBRE AS NomPlan, GENDETCON.GDECODIGO FROM GENDETCON INNER JOIN SLNFACTUR ON GENDETCON.OID = SLNFACTUR.GENDETCON WHERE (CONVERT (char(7), SLNFACTUR.SFAFECFAC, 102) = @IdMes) ORDER BY GENDETCON.GDECODIGO" 
                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListMeses" Name="IdMes" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <asp:Button ID="BtnPreliminar" runat="server" Text="Ver Preliminar" />
&nbsp;<asp:Button ID="BtnGenerar" runat="server" Text="Generar Archivo" /></asp:Panel>
                <asp:Panel ID="PanelNumfact" runat="server" Visible="False">
              
                <asp:TextBox ID="TextBox1" runat="server" Height="203px" 
                    style="font-family: Tahoma; font-size: 8pt" TextMode="MultiLine" Width="98%"></asp:TextBox>
                <br />
&nbsp;<asp:Button ID="BtnNumfacts" runat="server" Text="Ver Preliminar" />
&nbsp;<asp:Button ID="BtnGenerar0" runat="server" Text="Generar Archivo" />
                    <br />
                    <asp:Label ID="LabelNomarchivo" runat="server" Visible="False"></asp:Label>
                    <br />
                </asp:Panel>
                <br />
       
                <asp:Label ID="Label1" runat="server"></asp:Label>
       
            </td>
            <td style="width: 75%; vertical-align: top;">
                <asp:LinkButton ID="LinkButton1" runat="server" Visible="False">LinkButton</asp:LinkButton>
                <asp:Panel ID="Panel1" runat="server" BorderColor="#999999" BorderStyle="Solid" 
                    BorderWidth="1px" Height="600px" ScrollBars="Vertical" Visible="False" 
                    Width="800px">
                    <asp:Label ID="LabelCantFacts" runat="server" 
                        style="font-weight: 700; color: #0000FF"></asp:Label>
                    <asp:GridView ID="GridMuestra" runat="server" DataSourceID="DataGridMuestra">
                    </asp:GridView>
                    <asp:SqlDataSource ID="DataGridMuestra" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                        
                        SelectCommand="SELECT ADNINGRESO.ainconsec as Ingreso,SUBSTRING(SLNFACTUR.SFANUMFAC, 1, 4) AS Prefijo, SUBSTRING(SLNFACTUR.SFANUMFAC, 5, 20) AS NumFactura, CASE WHEN TERTIPDOC = 1 THEN 'CC' ELSE (CASE WHEN TERTIPDOC = 2 THEN 'CE' ELSE CASE WHEN TERTIPDOC = 5 THEN 'PA' ELSE 'NI' END END) END AS TipoDocIps, GENTERCER.TERNUMDOC, 230790043001 AS CodHabilitacionIPS, GEENENTADM.ENTCODIGO AS CodigoEPS, 2 AS CodigoCuenta, GENDETCON.GDECODIGO AS CodigoContrato, GENCONTRA.GECCODIGO, CONVERT (nvarchar(10), SLNFACTUR.SFAFECFAC, 103) AS FechaFactura, CONVERT (decimal(11 , 2), SLNCONHOJ.SCONETPAC + SLNCONHOJ.SCONETENT) AS ValorBruto, CONVERT (decimal(11 , 2), SLNCONHOJ.SCONETPAC) AS ValCopago, CONVERT (decimal(11 , 2), 0) AS ValCopCompartido, CONVERT (decimal(11 , 2), 0) AS ValorIva, CONVERT (decimal(11 , 2), 0) AS ValorIco, CONVERT (decimal(11 , 2), 0) AS ValorModeradora, CONVERT (decimal(11 , 2), 0) AS ValorDesc, '' AS ConcepDesc, CONVERT (nvarchar(6), SLNFACTUR.SFAFECFAC, 112) AS Periodo, 3 AS CodRegional, 1 AS ClasOrigen, '' AS TipoServPgp, '' AS TipoServPaf, '' AS DiasTratamiento, CASE WHEN GENPACIEN.PACTIPDOC = 1 THEN 'CC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 2 THEN 'CE' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 3 THEN 'TI' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 4 THEN 'RC' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 5 THEN 'PA' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 6 THEN 'AS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 7 THEN 'MS' ELSE CASE WHEN GENPACIEN.PACTIPDOC = 10 THEN 'CD' ELSE 'AS' END END END END END END END END AS TipoDocPac, GENPACIEN.PACNUMDOC AS NumDocPac, GENPACIEN.PACPRINOM AS PacPriNom, GENPACIEN.PACSEGNOM AS PacSegNom, GENPACIEN.PACPRIAPE AS PacPriApel, GENPACIEN.PACSEGAPE AS PacSegApel, STR(DATEDIFF(year, GENPACIEN.GPAFECNAC, GETDATE()), 4, 0) AS EdadPac, CASE WHEN GENPACIEN.GPASEXPAC = 1 THEN 'M' ELSE CASE WHEN GENPACIEN.GPASEXPAC = 2 THEN 'F' ELSE 'X' END END AS Sexo, CASE WHEN GPAESTADO = 2 THEN '0' ELSE '1' END AS Estado, CASE WHEN GPADISSEV = 1 THEN 'S' ELSE 'N' END AS Discapacidad, CASE WHEN IPRTIPPRO = 1 THEN 'I' ELSE CASE WHEN IPRTIPPRO = 2 THEN 'M' ELSE 'P' END END AS TipoPrestacion, 'PND' AS CodPresPrincipal, '' AS CodPresDetalle, RTRIM(SLNSERPRO.SERDESSER) AS DescrpProced, CONVERT (nvarchar(10), SLNSERPRO.SERFECSER, 103) AS FechaProced, CONVERT (nvarchar(5), SLNSERPRO.SERFECSER, 114) AS HoraProced, CONVERT (decimal(11 , 0), SLNSERPRO.SERCANTID) AS Cantidad, CONVERT (decimal(11 , 2), SLNSERPRO.SERVALPRO) AS ValorUnitario, '0' AS ValorCompartido, CASE WHEN SLNSERPRO.SERCOPCTA = 2 THEN CONVERT (decimal(11 , 2) , SLNSERPRO.SERVALPAC) ELSE 0 END AS ValModeradora, CASE WHEN SLNSERPRO.SERCOPCTA = 1 THEN CONVERT (decimal(11 , 2) , SLNSERPRO.SERVALPAC) ELSE 0 END AS ValCopago, CONVERT (decimal(11 , 2), SLNSERPRO.SERVALPRO * SLNSERPRO.SERCANTID) AS ValorTotServicio, ADNINGRESO.AINNUMAUT AS CodAutorizacion, (SELECT TOP (1) GENDIAGNO_3.DIACODIGO FROM ADNDIAEGR INNER JOIN ADNEGRESO ON ADNDIAEGR.ADNEGRESO = ADNEGRESO.OID INNER JOIN GENDIAGNO AS GENDIAGNO_3 ON ADNDIAEGR.DIACODIGO = GENDIAGNO_3.OID WHERE (ADNDIAEGR.Tipo = 5) AND (ADNEGRESO.ADNINGRESO = ADNINGRESO.OID)) AS DxP, ADNEGRESO_1.ADETIPDIA AS TipoDiagnostico, CONVERT (nvarchar(10), ADNINGRESO.AINFECING, 103) AS FechaEntrada, CONVERT (nvarchar(5), ADNINGRESO.AINFECING, 114) AS HoraEntrada, CONVERT (nvarchar(10), ADNEGRESO_1.ADEFECSAL, 103) AS FechaSalida, CONVERT (nvarchar(5), ADNEGRESO_1.ADEFECSAL, 114) AS HoraSalida, CONVERT (char(7), SLNFACTUR.SFAFECFAC, 102) AS Expr1 FROM SLNFACTUR INNER JOIN ADNINGRESO ON SLNFACTUR.ADNINGRESO = ADNINGRESO.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENDETCON ON SLNFACTUR.GENDETCON = GENDETCON.OID INNER JOIN GENCONTRA ON GENDETCON.GENCONTRA1 = GENCONTRA.OID INNER JOIN GENTERCER ON GENCONTRA.GENTERCER1 = GENTERCER.OID INNER JOIN GEENENTADM ON GENCONTRA.DGNENTADM1 = GEENENTADM.OID INNER JOIN SLNCONHOJ ON ADNINGRESO.OID = SLNCONHOJ.ADNINGRES1 INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN ADNEGRESO AS ADNEGRESO_1 ON ADNINGRESO.OID = ADNEGRESO_1.ADNINGRESO LEFT OUTER JOIN INNPRODUC INNER JOIN SLNPROHOJ ON INNPRODUC.OID = SLNPROHOJ.INNPRODUC1 ON SLNSERPRO.OID = SLNPROHOJ.OID WHERE (GENDETCON.GDECODIGO = N'SUB01101') AND (CONVERT (char(7), SLNFACTUR.SFAFECFAC, 102) = '2016.08') ORDER BY NumFactura, SLNSERPRO.SERFECSER" 
                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

