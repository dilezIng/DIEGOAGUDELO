<%@ Page Title="" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Devolucion.aspx.vb" Inherits="Facturacion_PypEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; font-family: tahoma; font-size: 9pt;">
        <tr>
            <td style="width: 25%; vertical-align: top;">
                <asp:RadioButtonList ID="ListSedes" runat="server">
                    <asp:ListItem Selected="True" Value="0">Duitama</asp:ListItem>
                    <asp:ListItem Value="1">Devolucion</asp:ListItem>
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
       <asp:Button ID="BtnPreliminar" runat="server" Text="Ver Preliminar22" />
&nbsp;<asp:Button ID="BtnGenerar" runat="server" Text="Generar Archivo" /></asp:Panel>
                <asp:Panel ID="PanelNumfact" runat="server" Visible="False">
                       <asp:TextBox ID="TextBox1" runat="server" Height="203px" 
                    style="font-family: Tahoma; font-size: 8pt" TextMode="MultiLine" Width="98%"></asp:TextBox>
                <br />
&nbsp;<asp:Button ID="BtnNumfacts" runat="server" Text="Ver Preliminar99" />
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
                        SelectCommand="SELECT SUBSTRING(SLNFACTUR.SFANUMFAC, 1, 4) AS Prefijo, SUBSTRING(SLNFACTUR.SFANUMFAC, 5, 20) AS NumFactura, GENDETCON.GDENOMBRE as Entidad,  GENDETCON.GDECODIGO AS CodEntidad , GEENENTADM.ENTCODIGO AS CodigoEPS, CONVERT (nvarchar(10), SLNFACTUR.SFAFECFAC, 103) AS FechaFactura, CONVERT (decimal(11 , 0), SLNFACTUR.SFATOTFAC + SLNFACTUR.SFAVALPAC) AS ValorBruto, CONVERT (decimal(11 , 0), SLNFACTUR.SFAVALPAC) AS ValCopago, CONVERT (decimal(11 , 0), 0) AS ValCopCompartido, CONVERT (decimal(11 , 0), 0) AS ValorIva, CONVERT (decimal(11 , 0), 0) AS ValorIco, CONVERT (decimal(11 , 0), 0) AS ValorModeradora, CONVERT (decimal(11 , 0), 0) AS ValorDesc, CONVERT (decimal(11 , 0), SLNFACTUR.SFATOTFAC) AS ValorNeto,(SELECT TOP (1)  (SELECT GENUSUARIO.USUDESCRI FROM GENUSUARIO WHERE GENUSUARIO.OID = SLNFACTUR_1.GENUSUARIO1)  FROM SLNFACTUR AS SLNFACTUR_1 WHERE (ADNINGRESO = ADNINGRESO.OID) ORDER BY OID DESC) AS USARIO_FACTURA FROM GENCONTRA INNER JOIN GENTERCER ON GENCONTRA.GENTERCER1 = GENTERCER.OID INNER JOIN ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID ON GENCONTRA.OID = GENDETCON.GENCONTRA1 INNER JOIN GEENENTADM ON GENCONTRA.DGNENTADM1 = GEENENTADM.OID INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID   WHERE (GENDETCON.GDECODIGO = N'SUB01101') AND (CONVERT (char(7), SLNFACTUR.SFAFECFAC, 102) = '2016.08') ORDER BY NumFactura" 
                        ProviderName="<%$ ConnectionStrings:DG_ConnectionString.ProviderName %>">
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

