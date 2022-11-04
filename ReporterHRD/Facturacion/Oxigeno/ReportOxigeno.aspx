<%@ Page Title="Reporte Oxigeno" Language="vb" AutoEventWireup="false" MasterPageFile="~/PaginaMaestra.master" CodeFile="ReportOxigeno.aspx.vb" Inherits="ReportOxigeno" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="~/Recursos/Cargando.ascx" tagname="Cargando" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: 82px;
        }
        .auto-style4 {
            width: 197px;
        }
        .auto-style5 {
            font-size: small;
        }
        .auto-style46 {
            font-size: medium;
            color: #000000;
        }
        .auto-style48 {
            text-align: left;
        }
        .auto-style49 {
            width: 371px;
        }
        .auto-style50 {
            width: 265px;
        }
        .auto-style51 {
            width: 371px;
            height: 19px;
        }
        .auto-style52 {
            width: 265px;
            height: 19px;
        }
        .auto-style53 {
            text-align: left;
            height: 19px;
        }
        .auto-style54 {
            height: 19px;
            text-align: center;
            font-size: large;
        }
        .auto-style55 {
            text-align: center;
            font-size: large;
        }
        .auto-style56 {
            width: 371px;
            height: 6px;
        }
        .auto-style57 {
            width: 265px;
            height: 6px;
        }
        .auto-style58 {
            height: 6px;
        }
        .auto-style59 {
            height: 19px;
        }
        .auto-style60 {
            margin-right: 0px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table style="width: 100%;">
        <tr>
            <td class="auto-style2" colspan="3">
    
    <strong>
    <asp:Label runat="server" Text="Oxigeno Registrado" ID="Label1"></asp:Label>


                &nbsp;Salario Minimo
                    <asp:Label ID="Lbsalario" runat="server" CssClass="auto-style46"></asp:Label>


                </strong> </td>
        </tr>
        <tr>
            <td class="auto-style3"><strong>
    <asp:Label runat="server" Id="LBIn">Ingreso </asp:Label> </strong> </td>
            <td class="auto-style4"> <asp:TextBox id="Ingreso" runat="server"></asp:TextBox>


            </td>
            <td><asp:Button ID="BtnBuscar" runat="server" Text="Horas" />


            &nbsp; <asp:Button ID="BtnBuscarL" runat="server" Text="Litros" />


            </td>
        </tr>
        <tr>
            <td colspan="3">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="Dat" Font-Names="TAHOMA"   EmptyDataText="NO TIENE SUMINISTROS PENDIENTES">
            <Columns>
                <asp:BoundField DataField="Solicitud" HeaderText="Solicitudes Pendientes" SortExpression="Solicitud" />
                <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" />
                <asp:BoundField DataField="Fecha_Folio" HeaderText="Fecha_Folio" SortExpression="Fecha_Folio" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                <asp:BoundField DataField="Suministro" HeaderText="Suministro" SortExpression="Suministro" />
                <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
            </Columns>
        </asp:GridView>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="3"> 


                <table id="TbDatos" style="width: 100%;">
    <tr>
        <td class="auto-style1" valign="middle">
            <asp:SqlDataSource ID="SqlOxigeno" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT O2_Sum_Paciente.Solicitud, Litros as Litros,O2_Forma_Sum.Nombre AS 'Forma de Administraciòn', O2_Sum_Paciente.Fecha_Ini + ' ' + O2_Sum_Paciente.Hora_Ini AS Inicio, O2_Sum_Paciente.Fecha_Fin + ' ' + O2_Sum_Paciente.Hora_Fin AS Fin, CAST(CAST(O2_Sum_Paciente.Minutos AS DECIMAL(10 , 1)) / CAST(60 AS DECIMAL(10 , 1)) AS DECIMAL(10 , 1)) AS Horas, O2_Sum_Paciente.Val_Hora, O2_Sum_Paciente.ValorH AS 'Valor Total Horas', O2_Sum_Paciente.Litros AS 'Lts x Min', O2_Sum_Paciente.Litros_total AS 'Total Litros', '15' AS 'Valor Lts', O2_Sum_Paciente.ValorL AS 'Valor Total Lts', O2_Sum_Paciente.Usuario AS Suministra FROM O2_Sum_Paciente INNER JOIN O2_Forma_Sum ON O2_Sum_Paciente.Sum_Id = O2_Forma_Sum.Id WHERE (O2_Sum_Paciente.Ingreso = @Ingreso)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Ingreso" Name="Ingreso" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="Dat" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT Solicitud, Folio, Fecha_Folio, Codigo, Suministro, Observacion, Hora_Fin FROM O2_Sum_Paciente WHERE (Ingreso = @Ingreso) AND (Hora_Fin = '0')">
            <SelectParameters>
                <asp:ControlParameter ControlID="Ingreso" Name="Ingreso" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlResumen" runat="server" ConnectionString="<%$ ConnectionStrings:DbBridgeConnectionString %>" SelectCommand="SELECT O2_Forma_Sum.Nombre AS 'Forma de Administraciòn', CAST(SUM(CAST(O2_Sum_Paciente.Minutos AS DECIMAL(10 , 1))) / CAST(60 AS DECIMAL(10 , 1)) AS DECIMAL(10 , 1)) AS Horas, SUM(CAST(O2_Sum_Paciente.Litros_total AS DECIMAL(10 , 0))) AS 'Litros' FROM O2_Sum_Paciente INNER JOIN O2_Forma_Sum ON O2_Sum_Paciente.Sum_Id = O2_Forma_Sum.Id WHERE (O2_Sum_Paciente.Ingreso = @Ingreso) GROUP BY O2_Forma_Sum.Nombre">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Ingreso" Name="Ingreso" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlIngreso" runat="server" ConnectionString="<%$ ConnectionStrings:DGEMPRES02ConnectionString %>" SelectCommand="SELECT DISTINCT ADNINGRESO.AINCONSEC AS 'Ingreso', GENPACIEN.PACNUMDOC AS 'Documento', GENPACIEN.PACPRIAPE + N' ' + case when GENPACIEN.PACSEGAPE is null then '' else GENPACIEN.PACSEGAPE end + N' ' + GENPACIEN.PACPRINOM + N' ' + case when GENPACIEN.PACSEGNOM is null then '' else GENPACIEN.PACSEGNOM end AS 'Paciente', CAST(DATEDIFF(dd, GENPACIEN.GPAFECNAC, GETDATE()) / 365.25 AS int) AS 'Edad', GENDETCON.GDENOMBRE AS 'Entidad', GENDETCON.GDECODIGO AS REGIMEN, CONVERT (varchar, GENPACIEN.GPAFECNAC, 1) AS 'Fecha Nacimiento', GENPACIEND.PACDIRECCION AS Direcciòn, GENPACIENT.PACTELEFONO AS Telefono, GENMUNICI.MUNNOMMUN AS Municipio, CONVERT (varchar, ADNINGRESO.AINFECHOS, 1) AS 'Fecha Ingreso', CASE WHEN GENPACIEN.GPASEXPAC = 1 THEN 'Masculino' WHEN GENPACIEN.GPASEXPAC = 2 THEN 'Femenino' ELSE 'Indeterminado' END AS Sexo FROM GENPACIEN INNER JOIN ADNINGRESO ON GENPACIEN.OID = ADNINGRESO.GENPACIEN INNER JOIN GENDETCON ON ADNINGRESO.GENDETCON = GENDETCON.OID INNER JOIN GENPACIEND ON GENPACIEN.GENPACIEND = GENPACIEND.OID INNER JOIN GENPACIENT ON GENPACIEN.GENPACIENT = GENPACIENT.OID INNER JOIN GENMUNICI ON GENPACIEN.DGNMUNICIPIO = GENMUNICI.OID WHERE (ADNINGRESO.AINCONSEC = @Ingreso)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Ingreso" Name="Ingreso" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <asp:DataList ID="DataList1" runat="server" Font-Names="TAHOMA"  DataSourceID="SqlIngreso" CssClass="auto-style60" Width="1000px">
                <ItemTemplate>
                    <div class="auto-style48">
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style55" colspan="3"><strong>E.S.E. HOSPITAL REGIONAL DE DUITAMA</strong></td>
                            </tr>
                            <strong>
                            <tr>
                                <td class="auto-style54" colspan="3"><strong>OXIGENO SUMNISTRADO</strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style51">&nbsp;</td>
                                <td class="auto-style52">&nbsp;</td>
                                <td class="auto-style53">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3"><strong>DATOS PERSONALES</strong></td>
                            </tr>
                            <tr>
                                <td colspan="2"><strong>Nombre Paciente: </strong>  <asp:Label ID="PacienteLabel" runat="server" Text='<%# Eval("Paciente") %>' /></td>
                           
                          
                            <td class="auto-style48"><strong>Documento: </strong>
                                <asp:Label ID="DocumentoLabel" runat="server" Text='<%# Eval("Documento") %>' />
                            </td>
                            </tr>
                            <tr>
                                <td class="auto-style49"><strong>Fecha Nacimiento:</strong>
                                    <asp:Label ID="Fecha_NacimientoLabel" runat="server" Text='<%# Eval("[Fecha Nacimiento]") %>' />
                                </td>
                                <td class="auto-style50"><strong>Edad: </strong>
                                    <asp:Label ID="EdadLabel" runat="server" Text='<%# Eval("Edad") %>' />
                                </td>
                                <td class="auto-style48"><strong>Sexo:
                                    <asp:Label ID="SexoLabel" runat="server" Text='<%# Eval("Sexo") %>' />
                                    </strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style49"><strong>Direcciòn:</strong>
                                    <asp:Label ID="DirecciònLabel" runat="server" Text='<%# Eval("Direcciòn") %>' />
                                </td>
                                <td class="auto-style50"><strong>Telefono:</strong>
                                    <asp:Label ID="TelefonoLabel" runat="server" Text='<%# Eval("Telefono") %>' />
                                </td>
                                <td><strong>Municipio:</strong>
                                    <asp:Label ID="MunicipioLabel" runat="server" Text='<%# Eval("Municipio") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style56"></td>
                                <td class="auto-style57"></td>
                                <td class="auto-style58"></td>
                            </tr>
                            <tr>
                                <td class="auto-style49"><strong>Ingreso:</strong>
                                    <asp:Label ID="IngresoLabel" runat="server" Text='<%# Eval("Ingreso") %>' />
                                </td>
                                <td class="auto-style50"><strong>Fecha Ingreso:</strong>
                                    <asp:Label ID="Fecha_IngresoLabel" runat="server" Text='<%# Eval("[Fecha Ingreso]") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style49"><strong>Entidad:</strong>
                                    <asp:Label ID="EntidadLabel" runat="server" Text='<%# Eval("Entidad") %>' />
                                </td>
                                <td class="auto-style50"><strong>Regimen:</strong>
                                    <asp:Label ID="REGIMENLabel" runat="server" Text='<%# Eval("REGIMEN") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            </strong>
                        </table>
                        <strong></strong>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:GridView ID="GridView1" Font-Names="TAHOMA" runat="server" AutoGenerateColumns="False" DataSourceID="SqlOxigeno" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                 
                   
                    <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" />
                    <asp:BoundField DataField="Forma de Administraciòn" HeaderText="Forma de Administraciòn" SortExpression="Forma de Administraciòn" />
                    <asp:BoundField DataField="Inicio" HeaderText="Inicio5" SortExpression="Inicio" ReadOnly="True" />
                    <asp:BoundField DataField="Fin" HeaderText="Fin" SortExpression="Fin" ReadOnly="True" />
                    <asp:BoundField DataField="Horas" HeaderText="Horas" SortExpression="Horas" ReadOnly="True" />
<asp:BoundField DataField="Litros" HeaderText="Litros Suministrados" SortExpression="Litros" ReadOnly="True" />
                    <asp:BoundField DataField="Val_Hora" HeaderText="Val_Hora" SortExpression="Val_Hora" />
                    <asp:BoundField DataField="Valor Total Horas" HeaderText="Valor Total Horas" SortExpression="Valor Total Horas" />
                  
                    <asp:BoundField DataField="Suministra" HeaderText="Suministra" SortExpression="Suministra" />
                </Columns>
               <EditRowStyle BackColor="#2461BF" Font-Size="Small" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"  Font-Size="Small" />
            
                <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="GridView3" Font-Names="TAHOMA" Width="1000px" runat="server" AutoGenerateColumns="False" DataSourceID="SqlOxigeno" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                 
                   
                    <asp:BoundField DataField="Solicitud" HeaderText="Solicitud" SortExpression="Solicitud" />
                    <asp:BoundField DataField="Forma de Administraciòn" HeaderText="Forma de Administraciòn" SortExpression="Forma de Administraciòn" />
                    <asp:BoundField DataField="Inicio" HeaderText="Inicio" SortExpression="Inicio" ReadOnly="True" />
                    <asp:BoundField DataField="Fin" HeaderText="Fin" SortExpression="Fin" ReadOnly="True" />
					<asp:BoundField DataField="Litros" HeaderText="Litros Suministrados" SortExpression="Litros" ReadOnly="True" />
                    <asp:BoundField DataField="Horas" HeaderText="Horas" SortExpression="Horas" ReadOnly="True" />
                    <asp:BoundField DataField="Lts x Min" HeaderText="Lts x Min" SortExpression="Lts x Min" />
                    <asp:BoundField DataField="Total Litros" HeaderText="Total Litros" SortExpression="Total Litros" ControlStyle-Font-Size="XX-Small" ItemStyle-Font-Size="XX-Small" />
                    <asp:BoundField DataField="Valor Lts" HeaderText="Valor Lts" ReadOnly="True" SortExpression="Valor Lts" />
                    <asp:BoundField DataField="Valor Total Lts" HeaderText="Valor Total Lts" SortExpression="Valor Total Lts" />
                    <asp:BoundField DataField="Suministra" HeaderText="Suministra" SortExpression="Suministra" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" Font-Size="Small" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"  Font-Size="Small" />
            
                <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <div class="auto-style48">
                <strong style="font-size: small">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                RESUMEN</strong><br />
            </div>
            <asp:GridView ID="GridView4" Font-Names="TAHOMA" runat="server" AutoGenerateColumns="False" DataSourceID="SqlResumen" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                 
                   
                    <asp:BoundField DataField="Forma de Administraciòn" HeaderText="Forma de Administraciòn" SortExpression="Forma de Administraciòn" />
                    <asp:BoundField DataField="Horas" HeaderText="Horas" SortExpression="Horas" ReadOnly="True" />
                    <asp:BoundField DataField="Litros" HeaderText="Litros" SortExpression="Litros" ReadOnly="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            <br />
        </td>
    </tr>
</table>


            </td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style59"><strong>
    <asp:Label runat="server" Id="Autor" CssClass="auto-style5">Ing. Diego A. </asp:Label> </strong> </td>
        </tr>
    </table>
    
    <strong>


    <br />
    <br />
    </strong>&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <br />
    <br />




</asp:Content>