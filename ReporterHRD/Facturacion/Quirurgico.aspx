<%@ Page Title="Resumen Quirúrgico" Language="VB" MasterPageFile="~/PaginaMaestra.master" AutoEventWireup="false" CodeFile="Quirurgico.aspx.vb" Inherits="Quirurgico" %>

<%@ Register src="../Recursos/Cargando.ascx" tagname="cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        height: 72px;
    }
        .style2
        {
            width: 100%;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>

             <asp:Label ID="LblProgress" runat="server">
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
          <%--</ContentTemplate>
    </asp:UpdatePanel> --%> 
    <table style="width: 100%; font-family: tahoma;" >
        <tr >
            <td colspan="4" 
                style="font-weight: bold; font-size: 20pt; color: #FFFFFF; background-image: url('../Images/Fondo01.jpg');" 
                >
                Resumen Quirúrgico</td>
        </tr>
        <tr >
            <td style="width: 25%; font-size: 8pt; vertical-align: top;" rowspan="3" >
                Seleccione un Especialidad<br />
                <asp:ListBox ID="ListProceds" runat="server" DataSourceID="DataProcedimientos" 
                    DataTextField="NomPrQx" DataValueField="IdPrQx" Height="200px" Width="98%" 
                    AutoPostBack="True" AppendDataBoundItems="True">
                    <asp:ListItem Value="-1">Todos</asp:ListItem>
                </asp:ListBox>
                <asp:SqlDataSource ID="DataProcedimientos" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    SelectCommand="SELECT GENESPECI.OID AS IdPrQx, GENESPECI.GEEDESCRI + N' (' + CONVERT (char(3), GENESPECI.GEECODIGO) + N')' AS NomPrQx FROM GENESPECI INNER JOIN SLNSERPRO ON GENESPECI.OID = SLNSERPRO.DGNESPECI1 WHERE (SLNSERPRO.SERTIPCAP &lt;&gt; 1) GROUP BY GENESPECI.OID, GENESPECI.GEEDESCRI + N' (' + CONVERT (char(3), GENESPECI.GEECODIGO) + N')' ORDER BY NomPrQx">
                </asp:SqlDataSource>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="DataResProceds" 
                    ImageType="Jpeg" >
                    <Series>
                        <asp:Series Name="Series1" XValueMember="IdMes" YValueMembers="Expr1">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </td>
            <td style="vertical-align: top; font-size: 8pt;" class="style1" >
                
                Seleccione un Año<br />
                <asp:ListBox ID="ListAños" runat="server" AutoPostBack="True">
                </asp:ListBox>
                
            </td>
            <td style="vertical-align: top; font-size: 8pt;" class="style1" colspan="2" >
                
           
                
                <asp:LinkButton ID="BtnContraer" runat="server">Contraer todo</asp:LinkButton>
                
           
                
            </td>

        </tr>
        <tr >
            <td colspan="3" 
                style="border: 1px solid #C0C0C0; width: 75%; vertical-align: top; background-color: #F0F0F0; height: 20px;" >
                <asp:Label ID="LabelEspecialidad" runat="server" Font-Bold="True" 
                    Text="Seleccione una especialidad y el año"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="width: 75%; vertical-align: top;">
                <asp:DataList ID="ListResProceds" runat="server" DataSourceID="DataResProceds" 
                    Font-Size="10pt" Width="600px">
                    <AlternatingItemStyle BackColor="#F0F0F0" />
                    <ItemTemplate>
                        <table style="border: 1px solid #CCCCCC; width: 590px">
                            <tr>
                                <td style="width: 25%">
                                    <asp:Label ID="Expr2Label" runat="server" 
                                        style="font-weight: 700; font-size: 12pt; color: #006600" 
                                        Text='<%# Eval("Expr2") %>' />
                                    <asp:Label ID="LabelIdMes" runat="server" Text='<%# Eval("IdMes") %>' 
                                        Visible="False"></asp:Label>
                                </td>
                                <td style="width: 35%">
                                    <asp:LinkButton ID="LinkGruposQx" runat="server" CommandName="GruposQx">Grupos Qx</asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkServiciosQx" runat="server" CommandName="ServiciosQx">Servicios</asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkMedicos" runat="server" CommandName="Medicos" 
                                        >Medicos</asp:LinkButton>
                                </td>
                                <td style="text-align: left; width: 20%; font-size: 12pt; font-weight: bold;">
                                    <asp:Label ID="LabelCant" runat="server" 
                                        style="font-weight: 700; font-size: 12pt; color: #800000" 
                                        Text='<%# Eval("Cant") %>' />
                                </td>
                                <td style="text-align: right; width: 20%; font-size: 12pt; font-weight: bold;">
                                    $<asp:Label ID="Expr1Label" runat="server" 
                                        Text='<%# Eval("Expr1", "{0:N0}") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align: right;">
                                    <asp:DataList ID="ListQx" runat="server" BackColor="White" BorderColor="Silver" 
                                        BorderStyle="Solid" BorderWidth="1px" DataSourceID="DataListQx" Enabled="False" 
                                        Font-Size="8pt" Visible="False" Width="98%">
                                        <AlternatingItemStyle BackColor="#F0F0F0" />
                                        <ItemTemplate>
                                            <table class="style2">
                                                <tr>
                                                    <td style="width: 50%; text-align: left;">
                                                        <asp:Label ID="Expr2Label" runat="server" Text='<%# Eval("Expr2") %>' />
                                                    </td>
                                                    <td style="width: 50%">
                                                        $<asp:Label ID="Expr1Label" runat="server" 
                                                            Text='<%# Eval("Expr1", "{0:N0}") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="ListSerIps" runat="server" BackColor="White" 
                                        BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" 
                                        DataSourceID="DataListSerIps" Enabled="False" Font-Size="8pt" Visible="False" 
                                        Width="98%">
                                        <AlternatingItemStyle BackColor="#F0F0F0" />
                                        <ItemTemplate>
                                            <table class="style2">
                                                <tr>
                                                    <td style="width: 10%; text-align: left;">
                                                        <asp:Label ID="LabelCant" runat="server" Text='<%# Eval("Cant") %>' />
                                                    </td>
                                                    <td style="width: 50%; text-align: left;">
                                                        <asp:Label ID="Expr2Label0" runat="server" Text='<%# Eval("SIPNOMBRE") %>' />
                                                    </td>
                                                    <td style="width: 40%">
                                                        $<asp:Label ID="Expr1Label0" runat="server" 
                                                            Text='<%# Eval("Valor", "{0:N0}") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:DataList ID="ListProfesionales" runat="server" BackColor="White" 
                                        BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" 
                                        DataSourceID="DataListProfs" Enabled="False" Font-Size="8pt" Visible="False" 
                                        Width="98%">
                                        <AlternatingItemStyle BackColor="#F0F0F0" />
                                        <ItemTemplate>
                                            <table class="style2">
                                                <tr>
                                                    <td style="width: 10%; text-align: left;">
                                                        <asp:Label ID="LabelCant" runat="server" Text='<%# Eval("Cant") %>' />
                                                    </td>
                                                    <td style="width: 50%; text-align: left;">
                                                        <asp:Label ID="Expr2Label0" runat="server" 
                                                            Text='<%# Eval("NomProfesional") %>' />
                                                    </td>
                                                    <td style="width: 40%">
                                                        $<asp:Label ID="Expr1Label0" runat="server" 
                                                            Text='<%# Eval("Valor", "{0:N0}") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="DataListQx" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ListProceds" Name="IdEspecialidad" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ListAños" Name="Año" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="LabelIdMes" Name="IdMes" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DataListSerIps" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ListProceds" Name="IdEspecialidad" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ListAños" Name="Año" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="LabelIdMes" Name="IdMes" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DataListProfs" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ListProceds" Name="IdEspecialidad" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ListAños" Name="Año" 
                                    PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="LabelIdMes" Name="IdMes" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="DataResProceds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DG_ConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT SUM(SLNPAQHOJ.SPHVALSER) AS Expr1, CASE WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '01') THEN 'Enero' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '02') THEN 'Febrero' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '03') THEN 'Marzo' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '04') THEN 'Abril' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '05') THEN 'Mayo' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '06') THEN 'Junio' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '07') THEN 'Julio' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '08') THEN 'Agosto' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '09') THEN 'Septiembre' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '10') THEN 'Octubre' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '11') THEN 'Noviembre' ELSE ('Diciembre') END AS Expr2, CONVERT (int, CONVERT (char(2), SLNSERPRO.SERFECSER, 101)) AS IdMes, COUNT(GENSERIPS.OID) AS Cant FROM ADNINGRESO INNER JOIN SLNFACTUR ON ADNINGRESO.OID = SLNFACTUR.ADNINGRESO INNER JOIN SLNSERPRO ON ADNINGRESO.OID = SLNSERPRO.ADNINGRES1 INNER JOIN GENESPECI ON SLNSERPRO.DGNESPECI1 = GENESPECI.OID INNER JOIN SLNPAQHOJ ON SLNSERPRO.OID = SLNPAQHOJ.SLNSERPRO1 INNER JOIN GENPACIEN ON ADNINGRESO.GENPACIEN = GENPACIEN.OID INNER JOIN GENPAQUET ON SLNPAQHOJ.GENPAQUET1 = GENPAQUET.OID INNER JOIN GENSERIPS ON GENPAQUET.GENSERIPS1 = GENSERIPS.OID WHERE (SLNSERPRO.SERTIPCAP &lt;&gt; 1) AND (SLNSERPRO.DGNESPECI1 = COALESCE (NULLIF (@IdEspecialidad, - 1), SLNSERPRO.DGNESPECI1)) AND (CONVERT (char(4), SLNSERPRO.SERFECSER, 102) = @Año) AND (SLNFACTUR.SFADOCANU = 0) GROUP BY CASE WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '01') THEN 'Enero' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '02') THEN 'Febrero' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '03') THEN 'Marzo' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '04') THEN 'Abril' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '05') THEN 'Mayo' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '06') THEN 'Junio' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '07') THEN 'Julio' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '08') THEN 'Agosto' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '09') THEN 'Septiembre' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '10') THEN 'Octubre' WHEN (CONVERT (char(2) , SLNSERPRO.SERFECSER , 101) = '11') THEN 'Noviembre' ELSE ('Diciembre') END, CONVERT (int, CONVERT (char(2), SLNSERPRO.SERFECSER, 101))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListProceds" Name="IdEspecialidad" 
                            PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ListAños" Name="Año" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr >
            <td style="width: 25%" >
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
        </tr>
        <tr >
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
            <td style="width: 25%" >
                &nbsp;</td>
        </tr>
    </table>
   
</ContentTemplate>
    </asp:UpdatePanel>    
       
</asp:Content>

